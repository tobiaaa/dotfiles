return {
  "github/copilot.vim",
  -- cmd = { "Copilot" },
  keys = {
    {
      "<leader>cc",
      "<cmd>Copilot<CR><cmd>Copilot enable<CR>",
      desc = "Enable Copilot",
    },
    {
      "<leader-CC>",
      "<cmd>Copilot disable<CR>",
      desc = "Disable Copilot",
    },
  },
  config = function()
    vim.keymap.set("i", "vv", 'copilot#Accept("")', {
      expr = true,
      replace_keycodes = false,
    })
  end,
}
