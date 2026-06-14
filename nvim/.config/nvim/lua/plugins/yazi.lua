return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    {
      "<leader>E",
      mode = { "n", "v" },
      "<cmd>Yazi cwd<cr>",
      desc = "Open yazi",
    },
  },
}
