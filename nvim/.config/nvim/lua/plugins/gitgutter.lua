return {
  "airblade/vim-gitgutter",
  event = "VeryLazy",
  config = function()
    local map = vim.keymap.set
    map("n", "<leader>gu", "<cmd>GitGutterUndoHunk<CR>", { desc = "Git Restore Hunk" })
    map("n", "<leader>gn", "<cmd>GitGutterNextHunk<CR>", { desc = "Git Next Hunk" })
    map("n", "<leader>gp", "<cmd>GitGutterPrevHunk<CR>", { desc = "Git Previous Hunk" })
    map("n", "<leader>gs", "<cmd>GitGutterPreviewHunk<CR>", { desc = "Git Preview Hunk" })

  end,
}
