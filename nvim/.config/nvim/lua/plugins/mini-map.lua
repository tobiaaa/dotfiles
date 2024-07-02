return {
    "wfxr/minimap.vim",
    event = 'VeryLazy',
    ft = { "python", "lua" },
    config = function()
        vim.g["minimap_auto_start"] = 1
        vim.g["minimap_background_processing"] = 1
        vim.g["minimap_git_colors"] = 1

        local map = vim.keymap.set

        map("n", "<leader>Mt", "<cmd>MinimapToggle<CR>", { desc = "Toggle Minimap" })

        -- Color Options
        vim.api.nvim_set_hl(0, 'minimapCursor', { bg = "#6C7086", fg = "#CBA6F7" })
        vim.api.nvim_set_hl(0, 'minimapRange', { bg = "#313244", fg = "#CDD6F4" })
    end
}
