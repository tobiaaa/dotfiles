return {
    "chentoast/marks.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        local marks = require("marks")
        local opts = {
            default_mappings = true,
            mappings = {
                set_next = "mm",
                next = "m.",
                prev = "m,",
                preview = "m:",
                delete_line = "dmm",
                delete_buf = "dmx"
            }
        }
        marks.setup(opts)
    end
}
