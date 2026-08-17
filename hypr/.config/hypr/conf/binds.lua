-- See https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod = "SUPER"

-- Actions
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("wezterm"), { submap_universal = true }) -- Open WezTerm
hl.bind(mainMod .. " + Q", hl.dsp.window.close())                                        -- Close current window
-- hl.bind(mainMod .. " + M", hl.dsp.exit())                                             -- Exit Hyprland
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + F", hl.dsp.window.float())                                        -- Toggle between tiling and floating window
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen())                           -- Open the window in fullscreen
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("rofi -show combi"))                      -- Open rofi
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.group.toggle())                                -- Toggle group
-- hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())                                    -- dwindle
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))                              -- dwindle
-- hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("~/.config/ml4w/settings/browser.sh"))     -- Opens the browser
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("~/.config/ml4w/scripts/reload-waybar.sh"))    -- Reload Waybar
-- hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("~/.config/ml4w/scripts/reload-hyprpaper.sh")) -- Reload hyprpaper after changing the wallpaper

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+ && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"))
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%- && wpctl set-mute @DEFAULT_AUDIO_SINK@ 0"))
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86WLAN",              hl.dsp.exec_cmd("nmcli radio wifi toggle"))
hl.bind("XF86Refresh",           hl.dsp.exec_cmd("xdotool key F5"))
hl.bind("Print",                 hl.dsp.exec_cmd("~/.local/share/scripts/screenshot"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "l" })) -- Move focus left
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "r" })) -- Move focus right
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "u" })) -- Move focus up
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "d" })) -- Move focus down

-- Move window with mainMod + SHIFT + arrow keys
hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "l" })) -- Move window left
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "r" })) -- Move window right
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "u" })) -- Move window up
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "d" })) -- Move window down

-- Groups
hl.bind(mainMod .. " + G", hl.dsp.submap("group"))
hl.bind(mainMod .. " + TAB", hl.dsp.group.next())

hl.define_submap("group", function()
    hl.bind("t", hl.dsp.group.toggle())                              -- Toggle group
    hl.bind("left",  hl.dsp.window.move({ into_group = "l" }))       -- Move to group left
    hl.bind("right", hl.dsp.window.move({ into_group = "r" }))       -- Move to group right
    hl.bind("up",    hl.dsp.window.move({ into_group = "u" }))       -- Move to group up
    hl.bind("down",  hl.dsp.window.move({ into_group = "d" }))       -- Move to group down
    hl.bind("x", hl.dsp.window.move({ out_of_group = true }))
    hl.bind("n", hl.dsp.group.next())
    hl.bind("p", hl.dsp.group.prev())
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Window management
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.submap("window"))

hl.define_submap("window", function()
    hl.bind("left",  hl.dsp.focus({ direction = "l" })) -- Move focus left
    hl.bind("right", hl.dsp.focus({ direction = "r" })) -- Move focus right
    hl.bind("up",    hl.dsp.focus({ direction = "u" })) -- Move focus up
    hl.bind("down",  hl.dsp.focus({ direction = "d" })) -- Move focus down

    hl.bind("SHIFT + right", hl.dsp.window.resize({ x =  20, y =   0, relative = true }), { repeating = true })
    hl.bind("SHIFT + left",  hl.dsp.window.resize({ x = -20, y =   0, relative = true }), { repeating = true })
    hl.bind("SHIFT + up",    hl.dsp.window.resize({ x =   0, y = -20, relative = true }), { repeating = true })
    hl.bind("SHIFT + down",  hl.dsp.window.resize({ x =   0, y =  20, relative = true }), { repeating = true })

    hl.bind("e", hl.dsp.layout("splitratio 1.0 exact"))
    hl.bind("s", hl.dsp.layout("swapsplit"))
    hl.bind("SHIFT + e", hl.dsp.exec_cmd("~/.local/share/scripts/equal_layout.sh"))
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true }) -- Move window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- Resize window
