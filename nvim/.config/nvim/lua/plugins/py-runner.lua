return {
    "tobiaaa/py-runner.nvim",
    dependencies = {
        "stevearc/dressing.nvim"
    },
    event="VeryLazy",
    config = function ()
        local runner = require("runner")
        runner.setup()
    end
}
