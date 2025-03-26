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

        local opts = { buffer = 0 }
        map("t", "<ESC>", "<C-\\><C-n>", opts, { desc = "Exit terminal mode" })

        map("t", "<C-h>", "<cmd>wincmd h<CR>")
        map("t", "<C-j>", "<cmd>wincmd j<CR>")
        map("t", "<C-k>", "<cmd>wincmd k<CR>")
        map("t", "<C-l>", "<cmd>wincmd l<CR>")
        map("t", "<C-w>", "<C-\\><C-n><C-w>")
    end


}
