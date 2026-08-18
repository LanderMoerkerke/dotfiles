-- Fetchers / plugin setup
require("git"):setup()

-- Community-plugin setups are pcall-guarded: a config slip can't brick yazi.
pcall(function()
	require("full-border"):setup({ type = ui.Border.ROUNDED })
end)

pcall(function()
	require("relative-motions"):setup({ show_numbers = "relative_absolute", show_motion = true })
end)

pcall(function()
	require("bookmarks"):setup({
		last_directory = { enable = false, persist = false },
		persist = "all",
		desc_format = "full",
		file_pick_mode = "hover",
		notify = { enable = false },
	})
end)

-- Rich status line (yatline). If this errors, yazi falls back to its default
-- status (owner shown below) instead of crashing.
local yatline_ok = pcall(function()
	require("yatline"):setup({
		style_a = { fg = "black", bg_mode = "theme" },
		style_b = { bg = "#585b70", fg = "#cdd6f4" },
		style_c = { bg = "#313244", fg = "#cdd6f4" },
		show_background = false,
		display_header_line = true,
		display_status_line = true,
	})
end)

-- Fallback owner:group in the status if yatline didn't take
if not yatline_ok then
	Status:children_add(function()
		local h = cx.active.current.hovered
		if h == nil or ya.target_family() ~= "unix" then
			return ""
		end
		return ui.Line({
			ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
			":",
			ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
			" ",
		})
	end, 500, Status.RIGHT)
end
