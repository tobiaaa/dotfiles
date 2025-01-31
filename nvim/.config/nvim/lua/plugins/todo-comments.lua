return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require "todo-comments"

    local opts = { keywords = {
      DEBUG = { icon = "", color = "#CBA6F7" },
    } }

    todo_comments.setup(opts)
  end,
}
