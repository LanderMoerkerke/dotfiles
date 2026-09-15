-- Hyprland Lua config, converted from hyprland.conf (hyprlang deprecated since 0.55).
-- Wiki: https://wiki.hypr.land/Configuring/Start/

local mocha = require("mocha")

local mainMod = "SUPER"

------------------
---- MONITORS ----
------------------
-- Native monitor handling, replaces way-displays / nwg-displays
-- (monitors.conf / workspaces.conf no longer sourced).

hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })

-- USB-C Dell: to the right of the laptop screen (desc-matched, port-independent)
hl.monitor({ output = "desc:Dell Inc. DELL P2720DC 81WTK9CR0QBS", mode = "preferred", position = "auto-right", scale = 1 })

-- Catch-all: any other hotplugged monitor gets its preferred mode,
-- placed above the laptop screen (center-aligned).
hl.monitor({ output = "", mode = "preferred", position = "auto-center-up", scale = 1 })

-- Lid switch: closing the lid disables eDP-1 so its workspaces migrate to
-- the external monitor; opening re-enables it and moves them back. Guard:
-- never disable the only monitor. (If logind suspends on lid close, set
-- HandleLidSwitch=ignore in /etc/systemd/logind.conf.)
local lidWorkspaces = {}

hl.bind("switch:on:Lid Switch", function()
    if #hl.get_monitors() <= 1 then return end
    lidWorkspaces = {}
    for _, ws in ipairs(hl.get_workspaces()) do
        if ws.monitor ~= nil and ws.monitor.name == "eDP-1" and not ws.special then
            table.insert(lidWorkspaces, ws.id)
        end
    end
    hl.monitor({ output = "eDP-1", disabled = true })
end, { locked = true })

hl.bind("switch:off:Lid Switch", function()
    -- disabled = false must be explicit: the disable rule above sticks otherwise
    hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1, disabled = false })
    hl.exec_scheduled_prop_refresh_immediately()
    -- give the modeset a moment, then bring the laptop workspaces home
    hl.timer(function()
        for _, id in ipairs(lidWorkspaces) do
            hl.dispatch(hl.dsp.workspace.move({ workspace = id, monitor = "eDP-1" }))
        end
        lidWorkspaces = {}
    end, { timeout = 500, type = "oneshot" })
end, { locked = true })

-------------
---- ENV ----
-------------
-- This machine runs Intel i915 (eDP) + nouveau (dGPU), pure mesa stack.
-- The old proprietary-NVIDIA env block (LIBVA_DRIVER_NAME=nvidia,
-- GBM_BACKEND=nvidia-drm, __GLX_VENDOR_LIBRARY_NAME=nvidia) was stale and
-- caused "MESA-LOADER: failed to open nvidia-drm" at startup.
hl.env("LIBVA_DRIVER_NAME", "iHD") -- intel-media-driver for VA-API
hl.env("XDG_SESSION_TYPE", "wayland")

hl.env("QT_QPA_PLATFORM", "wayland")

-------------------
---- AUTOSTART ----
-------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("/usr/bin/kdeconnectd")
    hl.exec_cmd("battery-popup -L 20 -n -i /home/lander/Pictures/Notifications/low-battery.png")
    hl.exec_cmd("wbg -s /home/lander/Pictures/bg.jpg")
    hl.exec_cmd("foot --server")
    hl.exec_cmd("waybar")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("swayidle")
end)

-----------------
---- OPTIONS ----
-----------------
hl.config({
    input = {
        kb_layout  = "eu",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape",
        kb_rules   = "",

        repeat_rate  = 50,
        repeat_delay = 200,

        follow_mouse  = 1,
        mouse_refocus = false,

        touchpad = {
            disable_while_typing = true,
            natural_scroll       = true,
        },

        sensitivity = 0.5,

        float_switch_override_focus = 0,
    },

    cursor = {
        hide_on_key_press = true,
        -- no_warps = true,

        -- Hybrid Intel/nouveau multi-GPU: cursor plane on the secondary GPU's
        -- outputs can vanish (invisible cursor on external monitor).
        no_hardware_cursors = 1,
    },

    misc = {
        disable_hyprland_logo    = true,
        disable_splash_rendering = true,
        animate_manual_resizes   = true,
        enable_swallow           = true,
        swallow_regex            = "foot",
    },

    xwayland = {
        force_zero_scaling = true,
    },

    general = {
        gaps_in  = 5,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border          = { colors = { mocha.mauve, mocha.blue }, angle = 45 },
            inactive_border        = mocha.overlay0,
            nogroup_border_active  = { colors = { mocha.mauve, mocha.blue }, angle = 45 },
            nogroup_border         = mocha.overlay0,
        },

        layout = "scrolling",
        -- layout = "master",

        snap = {
            enabled = true,
        },
    },

    scrolling = {
        explicit_column_widths = "0.333, 0.5, 0.667, 1.0",
        -- explicit_column_widths = "0.5, 1.0",
    },

    master = {
        new_on_top        = true,
        allow_small_split = true,
        new_status        = "master",
    },

    decoration = {
        rounding = 5,

        dim_special = 0, -- no background dim when a scratchpad/special ws is shown

        blur = {
            enabled = true,
            size    = 3,
            passes  = 1,
        },

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },
    },

    animations = {
        enabled = true,
    },

    ecosystem = {
        no_update_news  = true,
        no_donation_nag = true,
    },
})

-- Monitor layout changed (hotplug, lid open/close): waybar renders glitched
-- on the surviving output -> restart it. Notify on connect.
-- Debounced: at boot monitor.added fires once per monitor, and each restart
-- raced the autostart spawn -> two waybars. One timer, last event wins.
local waybarTimer = nil
local function restartWaybar()
    if waybarTimer ~= nil then
        waybarTimer:set_enabled(false)
    end
    waybarTimer = hl.timer(function()
        hl.exec_cmd("killall waybar; sleep 0.3; waybar")
    end, { timeout = 1000, type = "oneshot" })
end

hl.on("monitor.added", function(m)
    hl.notification.create({ text = "Monitor connected: " .. m.name, timeout = 4000, icon = "ok" })
    restartWaybar()
end)

hl.on("monitor.removed", function()
    restartWaybar()
end)

-- gestures
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

--------------------
---- ANIMATIONS ----
--------------------
hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({ leaf = "windows",     enabled = true, speed = 3, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 2, bezier = "default", style = "slidevert" })
hl.animation({ leaf = "zoomFactor",  enabled = true, speed = 7, bezier = "default" })
hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 2, bezier = "default", style = "slidevert" })

---------------
---- BINDS ----
---------------
hl.bind(mainMod .. " + Return",         hl.dsp.exec_cmd("$TERMINAL"))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("samedirw"))

hl.bind(mainMod .. " + C",             hl.dsp.window.close())
hl.bind("CTRL + ALT + Delete",         hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float())
hl.bind(mainMod .. " + X",             hl.dsp.exec_cmd("lockscreenw"))
hl.bind(mainMod .. " + SHIFT + X",     hl.dsp.exec_cmd("systemctl hibernate"))

hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd("rofi -show drun -terminal $TERMINAL -width 25"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("rofimoji --action copy --clipboarder wl-copy --selector rofi --skin-tone moderate"))

hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("$TERMINAL -e yazi"))

-- Project picker (sesh): fuzzy-pick a project; focus its window if already open, else attach
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("sesh-jump"))

hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("gopass ls --flat | $PICKER -i | xargs --no-run-if-empty gopass -o | wl-copy"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd("gopass ls --flat | $PICKER -i | xargs --no-run-if-empty gopass otp -o | wl-copy"))

hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("useful-data"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("open-config"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("wg-actions"))

hl.bind(mainMod .. " + B",         hl.dsp.exec_cmd("$BROWSER"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("$BROWSER2"))

hl.bind(mainMod .. " + G",         hl.dsp.exec_cmd("echo -n $EMAIL_PRIMARY | wl-copy"))
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd("echo -n $EMAIL_SECONDARY | wl-copy"))

hl.bind(mainMod .. " + Insert", hl.dsp.exec_cmd("showclip"))
hl.bind("CTRL + SHIFT + Print", hl.dsp.exec_cmd("crop-screenshotw"))

hl.bind("CTRL + Space",             hl.dsp.exec_cmd("dunstctl close"))
hl.bind("CTRL + SHIFT + Space",     hl.dsp.exec_cmd("dunstctl history-pop"))
hl.bind("CTRL + SHIFT + Period",    hl.dsp.exec_cmd("dunstctl context"))
hl.bind(mainMod .. " + F1",         hl.dsp.exec_cmd("dunstctl set-paused true"))
hl.bind(mainMod .. " + SHIFT + F1", hl.dsp.exec_cmd("dunstctl set-paused false"))

hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("killall -SIGUSR1 waybar || waybar"))

-- nouveau misses USB-C DP hotplug uevents sometimes; reload re-probes outputs
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("hyprctl reload"))
-- ...and when the kernel itself missed the hotplug, kick the DP connectors
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd("hypr-kick-dp"))

hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + s",         hl.dsp.window.pin())
-- hl.bind(mainMod .. " + Backspace", ...) -- animatefocused

hl.bind("ALT + TAB",         hl.dsp.focus({ workspace = "previous" }))
hl.bind(mainMod .. " + TAB", hl.dsp.exec_cmd("hypr-select-window"))

-- -- master layout
-- hl.bind(mainMod .. " + Space",     hl.dsp.layout("swapwithmaster"))
-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("addmaster"))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("removemaster"))
-- hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapnext"))
-- hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapprev"))

-- scrolling layout
-- ("togglefit fit" from the old config was hyprscrolling-plugin syntax,
-- gone in the built-in scrolling layout -> dropped)
hl.bind(mainMod .. " + Space", hl.dsp.layout("promote"))
hl.bind(mainMod .. " + J",         hl.dsp.layout("move +col"))
hl.bind(mainMod .. " + K",         hl.dsp.layout("move -col"))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.layout("swapcol r"))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + H",         hl.dsp.layout("colresize -conf"))
hl.bind(mainMod .. " + L",         hl.dsp.layout("colresize +conf"))
-- Jump the view to the far edge of the tape (fit active..beginning / active..end)
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.layout("fit tobeg"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.layout("fit toend"))
hl.bind(mainMod .. " + f",         hl.dsp.layout("fit active"))

-- niri-style column stacking: pull window into previous column / expel to its own
-- ({ } = SHIFT+bracket; shifted keysyms need the base key + explicit SHIFT mod)
hl.bind(mainMod .. " + SHIFT + bracketleft",  hl.dsp.layout("consume_or_expel prev"))
hl.bind(mainMod .. " + SHIFT + bracketright", hl.dsp.layout("consume_or_expel next"))

-- focus up/down inside a stacked column (centers view, wraps)
hl.bind(mainMod .. " + bracketleft",  hl.dsp.layout("focus u"))
hl.bind(mainMod .. " + bracketright", hl.dsp.layout("focus d"))

-- hl.bind(mainMod .. " + H", hl.dsp.window.resize({ x = -30, y = 0, relative = true }))
-- hl.bind(mainMod .. " + L", hl.dsp.window.resize({ x = 30, y = 0, relative = true }))
-- hl.bind(mainMod .. " + J", hl.dsp.layout("cyclenext"))
-- hl.bind(mainMod .. " + K", hl.dsp.layout("cycleprev"))

hl.bind(mainMod .. " + N", hl.dsp.focus({ workspace = "+1" }))
hl.bind(mainMod .. " + P", hl.dsp.focus({ workspace = "-1" }))
hl.bind(mainMod .. " + E", hl.dsp.focus({ workspace = "emptynm" })) -- next empty workspace on this monitor

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9] (silent)
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Native scratchpads (named special workspaces), replaces pypr scratchpads:
-- they float above the scrolling tape, so they can't get lost off-screen.
hl.bind(mainMod .. " + T",         hl.dsp.workspace.toggle_special("term"))
hl.bind(mainMod .. " + V",         hl.dsp.workspace.toggle_special("volume"))
hl.bind(mainMod .. " + Z",         hl.dsp.workspace.toggle_special("ferdi"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.workspace.toggle_special("spotify"))
hl.bind(mainMod .. " + Y",         hl.dsp.workspace.toggle_special("video"))

-- native magnifier, replaces `pypr zoom`
hl.bind(mainMod .. " + SHIFT + Z", function()
    local zoom = hl.get_config("cursor.zoom_factor")
    hl.config({ cursor = { zoom_factor = (zoom > 1.0) and 1.0 or 2.0 } })
end)

-- fetch a window here / send it back (native pypr fetch_client_menu replacement)
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.exec_cmd("hypr-fetch-window"))
hl.bind(mainMod .. " + Escape",      hl.dsp.exec_cmd("hypr-unfetch-window"))

-- swap visible workspaces between monitors (native, symmetric with 2 monitors)
hl.bind(mainMod .. " + SHIFT + U", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))
hl.bind(mainMod .. " + SHIFT + I", hl.dsp.workspace.swap_monitors({ monitor1 = "current", monitor2 = "+1" }))

-- focus monitors
hl.bind(mainMod .. " + U", hl.dsp.focus({ monitor = "-1" }))
hl.bind(mainMod .. " + I", hl.dsp.focus({ monitor = "+1" }))

----------------------
---- WINDOW RULES ----
----------------------
-- Scratchpad windows: float, sized like the old pypr config, sent to their
-- own named special workspace.
local scratchpads = {
    term    = { class = "^(foot-scratchpad)$",                     size = { 0.75, 0.80 } },
    volume  = { class = "^(org\\.pulseaudio\\.)?[Pp]avucontrol$",  size = { 0.40, 0.90 } },
    ferdi   = { class = "^([Ff]erdium)$",                          size = { 0.45, 0.65 } },
    spotify = { class = "^([Ss]potify)$",                          size = { 0.70, 0.90 } },
    video   = { class = "^(firefox-video)$",                       size = { 0.80, 0.80 } },
}

for name, pad in pairs(scratchpads) do
    hl.window_rule({
        match     = { class = pad.class },
        float     = true,
        size      = { "monitor_w*" .. pad.size[1], "monitor_h*" .. pad.size[2] },
        center    = true,
        workspace = "special:" .. name .. " silent",
    })
end

-- Project terminals (Mod+O / sesh-jump) always open on workspace 2.
hl.window_rule({
    match     = { class = "^sesh:.*" },
    workspace = "2",
    maximize = true,
})

-- Lazy spawn: first toggle creates the workspace empty -> command runs.
hl.workspace_rule({ workspace = "special:term",    on_created_empty = "foot -a foot-scratchpad -e scratch-tmux" })
hl.workspace_rule({ workspace = "special:volume",  on_created_empty = "pavucontrol -t 1" })
hl.workspace_rule({ workspace = "special:ferdi",   on_created_empty = "ferdium" })
hl.workspace_rule({ workspace = "special:spotify", on_created_empty = "spotify" })
hl.workspace_rule({ workspace = "special:video",   on_created_empty = "firefox --new-instance --profile /home/lander/.local/share/firefox-video --name firefox-video" })

hl.window_rule({ match = { class = "^(firefox-video)$" }, idle_inhibit = "focus" })
hl.window_rule({ match = { class = "^([Dd]ragon.*)$" }, float = true, pin = true })

-- pypr `unfocus = "hide"`: auto-hide volume/spotify when focus leaves them.
local autohideSpecials = { ["special:volume"] = "volume", ["special:spotify"] = "spotify" }
hl.on("window.active", function(w)
    local sws = hl.get_active_special_workspace()
    if sws == nil then return end
    local name = autohideSpecials[sws.name]
    if name == nil then return end
    if w == nil or w.workspace == nil or w.workspace.name ~= sws.name then
        hl.dispatch(hl.dsp.workspace.toggle_special(name))
    end
end)

hl.window_rule({ match = { class = "^(org.qutebrowser.qutebrowser)" }, workspace = "1" })
hl.window_rule({ match = { class = "^(firefox)$" },                    workspace = "5" })

--------------------
---- MEDIA KEYS ----
--------------------
hl.bind("ALT + Home",   hl.dsp.exec_cmd("playerctl --player=spotifyd,%any previous"),   { locked = true })
hl.bind("ALT + End",    hl.dsp.exec_cmd("playerctl --player=spotifyd,%any play-pause"), { locked = true })
hl.bind("ALT + Insert", hl.dsp.exec_cmd("playerctl --player=spotifyd,%any next"),       { locked = true })

-- XF Buttons
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("pactl -- set-sink-volume @DEFAULT_SINK@ +5%"), { repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("pactl -- set-sink-volume @DEFAULT_SINK@ -5%"), { repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("pactl set-sink-mute alsa_output.pci-0000_00_1f.3.analog-stereo toggle"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("pactl set-source-mute alsa_input.pci-0000_00_1f.3.analog-stereo toggle"))
hl.bind("XF86Bluetooth",         hl.dsp.exec_cmd("echo \"power on\\nconnect CC:98:8B:93:3A:17\" | bluetoothctl && pactl -- set-sink-volume bluez_sink.CC_98_8B_93_3A_17.a2dp_sink 100%"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })
hl.bind("XF86AudioNext",         hl.dsp.exec_cmd("playerctl --player=spotifyd,%any next"),     { locked = true })
hl.bind("XF86AudioPrev",         hl.dsp.exec_cmd("playerctl --player=spotifyd,%any previous"), { locked = true })
hl.bind("XF86AudioPlay",         hl.dsp.exec_cmd("playerctl --player=spotifyd,%any play"),     { locked = true })
hl.bind("XF86AudioPause",        hl.dsp.exec_cmd("playerctl --player=spotifyd,%any pause"),    { locked = true })
hl.bind("XF86PowerOff",          hl.dsp.exec_cmd("power-menu"))
