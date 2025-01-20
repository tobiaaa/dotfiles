return {
  "NeogitOrg/neogit",
  event='VeryLazy',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
    "ibhagwan/fzf-lua",
  },

  config = function()
    local map = vim.keymap.set

    map("n", "<leader>gg", "<cmd>Neogit kind=floating<CR>", { desc = "Open neogit" })
  end,
}
