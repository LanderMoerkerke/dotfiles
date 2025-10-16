Status:children_add(
    function()
        local h = cx.active.current.hovered
        if h == nil or ya.target_family() ~= "unix" then
            return ""
        end

        return ui.Line {
            ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
            ":",
            ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
            " "
        }
    end,
    500,
    Status.RIGHT
)

require("git"):setup()
