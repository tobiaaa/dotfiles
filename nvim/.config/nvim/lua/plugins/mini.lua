return {
    'echasnovski/mini.nvim',
    event = "InsertEnter",
    config = function()
        require("mini.surround").setup()
    end,
}
