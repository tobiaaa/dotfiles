-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
    theme = "catppuccin",
    transparency = true,

    hl_override = {
        Comment = { italic = true },
        ["@comment"] = { italic = true },
    },
}

M.ui = {
    statusline = {
        theme = "default",
        separator_style = "round",
        order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor", "clock" },
        modules = {
            clock = function()
                require("os")
                -- Getting the current time in seconds since the Unix epoch
                local current_time = os.time()

                -- Converting the Unix timestamp to a date and time format
                local formatted_time = os.date("%d-%m %H:%M ", current_time)
                local separators = {}
                local config = require("nvconfig").ui.statusline
                local theme = config.theme
                local sep_style = config.separator_style

                local mode = {
                    default = {
                        default = { left = "", right = "" },
                        round = { left = "", right = "" },
                        block = { left = "█", right = "█" },
                        arrow = { left = "", right = "" },
                    },
                }

                separators = (type(sep_style) == "table" and sep_style) or mode[theme][sep_style]

                local sep_l = separators["left"]
                local sep_end = "%#St_sep_r#" .. separators["right"]

                -- From: NvChad/ui
                local function gen_block(icon, txt, sep_l_hlgroup, iconHl_group, txt_hl_group)
                    return sep_l_hlgroup .. sep_l .. iconHl_group .. icon .. " " .. txt_hl_group .. " " .. txt .. sep_end
                end

                if theme == "default" then
                    return "%#St_pos_sep#" .. sep_l .. "%#St_pos_icon#󰥔 %#St_pos_text# " .. formatted_time
                elseif theme == "vscode" or theme == "vscode_colored" then
                    return "%#StText# " .. formatted_time
                end

                return gen_block("󰥔", formatted_time, "%#St_Pos_sep#", "%#St_Pos_bg#", "%#St_Pos_txt#")
            end
        },
    },

    -- Override tabufline's "tabs" module so each tab page shows its name
    -- (vim.t.tabname, set by configs/workspaces) instead of just a number.
    -- Falls back to the bare number when a tab is unnamed. Click-to-switch is
    -- preserved via the original GotoTab handler.
    tabufline = {
        -- Drop the "btns" module (theme-toggle switch + close-all-buffers "x")
        -- that NvChad renders to the right of the tabs.
        order = { "treeOffset", "buffers", "tabs" },
        modules = {
            tabs = function()
                local btn = require("nvchad.tabufline.utils").btn
                local fn, g = vim.fn, vim.g
                local result, tabs = "", fn.tabpagenr "$"

                if tabs > 1 then
                    for nr = 1, tabs do
                        local tab_hl = "TabO" .. (nr == fn.tabpagenr() and "n" or "ff")
                        local name = fn.gettabvar(nr, "tabname", "")
                        local label = name ~= "" and (" " .. nr .. ":" .. name .. " ")
                            or (" " .. nr .. " ")
                        result = result .. btn(label, tab_hl, "GotoTab", nr)
                    end

                    local new_tabtn = btn(" 󰐕 ", "TabNewBtn", "NewTab")
                    local tabstoggleBtn = btn(" TABS ", "TabTitle", "ToggleTabs")
                    local small_btn = btn(" 󰅁 ", "TabTitle", "ToggleTabs")

                    return g.TbTabsToggled == 1 and small_btn
                        or new_tabtn .. tabstoggleBtn .. result
                end

                return ""
            end,
        },
    },
}



return M
