return {
  "tobiaaa/py-runner.nvim",
  dependencies = {
    "stevearc/dressing.nvim",
  },
  ft = { "python" },
  config = function()
    local runner = require "runner"
    runner.setup()
  end,
}
