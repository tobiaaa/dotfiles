return {
  "folke/todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local todo_comments = require("todo-comments")
    local map = vim.keymap.set

    map("n", "<leader>c-n", function()
      todo_comments.jump_next()
    end, { desc = "Next todo comment" })

    map("n", "<leader>c-p", function()
      todo_comments.jump_prev()
    end, { desc = "Previous todo comment" })

    todo_comments.setup()
  end,
}
