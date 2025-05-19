return {
  "mbbill/undotree",
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set
    map("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })

  end,
}
