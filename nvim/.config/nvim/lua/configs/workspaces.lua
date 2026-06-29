-- Tab "workspaces": open a named tab with a preset split layout.
--
-- Each tab is an isolated layout you can name and jump to -- the nvim
-- equivalent of a tmux window. Tab names render in NvChad's tabufline via the
-- "tabs" module override in chadrc.lua (reads vim.t.tabname).
--
-- Add a layout by dropping another function into the `layouts` table; it is
-- picked up automatically by :Workspace completion and the <leader>tw picker.

local M = {}

-- Count 1 is reserved for the global <leader>tt toggleterm. Each `dev` tab gets
-- its own terminal id so they don't clobber each other or the global one.
local term_count = 1

-- Set the current tab's name (shown in the tabline) and refresh the bar.
local function set_tabname(name)
    if name and name ~= "" then
        vim.t.tabname = name
        pcall(vim.cmd.redrawtabline)
    end
end

-- Layout presets. Each opens a fresh tab, names it, then builds its windows.
local layouts = {}

-- task/context: nvimtree left + bottom terminal + main editor.
-- Reuses the buffer that was current when invoked so the editor isn't empty.
layouts.dev = function(name)
    local cur = vim.api.nvim_get_current_buf()
    vim.cmd "tabnew"

    -- show the previously-focused file in the main window
    if vim.api.nvim_buf_is_valid(cur) and vim.bo[cur].buflisted then
        vim.api.nvim_set_current_buf(cur)
    end
    set_tabname(name or "dev")

    local editor = vim.api.nvim_get_current_win()

    -- file tree on the left
    vim.cmd "NvimTreeOpen"

    -- bottom terminal via toggleterm, unique to this tab
    term_count = term_count + 1
    vim.api.nvim_set_current_win(editor)
    vim.cmd(term_count .. "ToggleTerm size=12 direction=horizontal")

    -- land in the editor
    if vim.api.nvim_win_is_valid(editor) then
        vim.api.nvim_set_current_win(editor)
        vim.cmd "stopinsert"
    end
end

-- tool / scratch: a single fullscreen terminal.
layouts.term = function(name)
    vim.cmd "tabnew"
    set_tabname(name or "term")
    vim.cmd "terminal"
    vim.cmd "startinsert"
end

-- tool: a fullscreen terminal running claude. term_tabname.lua relabels the
-- buffer to "claude" too; the tab name keeps it visible even when the tab is
-- inactive.
layouts.claude = function(name)
    vim.cmd "tabnew"
    set_tabname(name or "claude")
    vim.cmd "terminal claude"
    vim.cmd "startinsert"
end

-- scratch: a throwaway unsaved buffer, no tree/terminal.
layouts.scratch = function(name)
    vim.cmd "tabnew"
    set_tabname(name or "scratch")
    local buf = vim.api.nvim_get_current_buf()
    vim.bo[buf].buftype = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile = false
end

-- Open a layout by key (used by :Workspace and the picker).
function M.open(layout, name)
    local fn = layouts[layout]
    if not fn then
        vim.notify("Unknown workspace layout: " .. tostring(layout), vim.log.levels.ERROR)
        return
    end
    fn(name)
end

-- Rename the current tab; prompts when no name is given.
function M.rename(name)
    if not name or name == "" then
        name = vim.fn.input("Tab name: ", vim.t.tabname or "")
    end
    set_tabname(name)
end

-- vim.ui.select picker over the available layouts (uses dressing/telescope).
function M.pick()
    local names = vim.tbl_keys(layouts)
    table.sort(names)
    vim.ui.select(names, { prompt = "Open workspace:" }, function(choice)
        if choice then
            M.open(choice)
        end
    end)
end

function M.setup()
    vim.api.nvim_create_user_command("Workspace", function(o)
        M.open(o.fargs[1], o.fargs[2])
    end, {
        nargs = "+",
        complete = function(arglead)
            local out = {}
            for _, n in ipairs(vim.tbl_keys(layouts)) do
                if n:find(arglead, 1, true) == 1 then
                    table.insert(out, n)
                end
            end
            table.sort(out)
            return out
        end,
        desc = "Open a tab workspace layout",
    })

    vim.api.nvim_create_user_command("TabRename", function(o)
        M.rename(o.args)
    end, { nargs = "?", desc = "Rename the current tab" })
end

return M
