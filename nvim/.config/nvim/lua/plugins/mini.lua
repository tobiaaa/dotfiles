return {
    'echasnovski/mini.nvim',
    event = "VeryLazy",
    config = function()
        -- gs prefix instead of the default s, which flash.nvim owns
        require("mini.surround").setup({
            mappings = {
                add = "gsa",
                delete = "gsd",
                find = "gsf",
                find_left = "gsF",
                highlight = "gsh",
                replace = "gsr",
                update_n_lines = "gsn",
                suffix_last = "l", -- gsdl = delete previous
                suffix_next = "n", -- gsdn = delete next
            },
        })
    end,
}
