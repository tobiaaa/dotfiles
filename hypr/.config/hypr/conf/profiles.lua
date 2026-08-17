-- Machine profiles: which workspaces live on which monitor, and where the
-- always-running apps land.
--
-- Replaces the old conf/work.conf + conf/home.conf, which were pulled in once
-- at login by `exec-once = hyprctl monitors | grep -q ... && hyprctl keyword source ...`.
-- Both profiles are now declared up front and toggled from monitor events, so
-- docking and undocking switches profile without a restart.

local M = {}

local LG   = "desc:LG Electronics LG HDR 4K 0x00043BAE"    -- work, primary
local U24  = "desc:Dell Inc. DELL U2422HE BBPVNM3"         -- work, secondary
local DELL = "desc:Dell Inc. DELL S2722QC 4CQWH24"         -- home
local BUILTIN = "eDP-1"

local work = {}
local home = {}

local function add(set, rule)
    set[#set + 1] = rule
    return rule
end

--------------------------------------------------------------------------------
-- Shared: the laptop screen always owns workspace 10
--------------------------------------------------------------------------------

hl.workspace_rule({ workspace = "10", monitor = BUILTIN, default = true })

--------------------------------------------------------------------------------
-- Work
--------------------------------------------------------------------------------

for i = 1, 8 do
    add(work, hl.workspace_rule({
        workspace = tostring(i),
        monitor   = LG,
        default   = i == 1,
        enabled   = false,
    }))
end

add(work, hl.workspace_rule({ workspace = "9", monitor = U24, default = true, enabled = false }))

add(work, hl.window_rule({
    name    = "work-thunderbird",
    match   = { class = "thunderbird" },
    workspace = "9 silent",
    enabled = false,
}))

add(work, hl.window_rule({
    name    = "work-slack",
    match   = { class = "slack" },
    workspace = "10 silent",
    enabled = false,
}))

add(work, hl.window_rule({
    name    = "work-python3",
    match   = { class = "python3" },
    monitor = "DP-8",
    enabled = false,
}))

--------------------------------------------------------------------------------
-- Home
--------------------------------------------------------------------------------

for i = 1, 9 do
    add(home, hl.workspace_rule({
        workspace = tostring(i),
        monitor   = DELL,
        default   = i == 1,
        enabled   = false,
    }))
end

add(home, hl.window_rule({
    name    = "home-thunderbird",
    match   = { class = "thunderbird" },
    workspace = "10 silent",
    enabled = false,
}))

add(home, hl.window_rule({
    name    = "home-slack",
    match   = { class = "slack" },
    workspace = "10 silent",
    enabled = false,
}))

--------------------------------------------------------------------------------
-- Switching
--------------------------------------------------------------------------------

-- The work profile wins when the work primary is connected; otherwise home.
function M.apply()
    local atWork = hl.get_monitor(LG) ~= nil

    for _, rule in ipairs(work) do rule:set_enabled(atWork) end
    for _, rule in ipairs(home) do rule:set_enabled(not atWork) end
end

-- monitor.layout_changed covers hotplug, mode changes and config reloads.
hl.on("hyprland.start", M.apply)
hl.on("monitor.layout_changed", M.apply)

-- ...and once now, so a live `hyprctl reload` takes effect immediately.
M.apply()

return M
