return {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
        local term = require("toggleterm")

        term.setup()
        local map = vim.keymap.set

        map("n", "<leader>tt", "<cmd>ToggleTerm size=12 direction=horizontal<CR>", { desc = "Toggle Terminal" })
        map("n", "<leader>tT", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating Terminal" })
        map("n", "<leader>ts", "<cmd>TermSelect<CR>", { desc = "Select Terminal" })
    end


}
