return {
    "numToStr/Comment.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function ()
        local comment = require("Comment")
        local opts = {
            mappings = {
                basic = true,
                extra = false,
            }
        }
        comment.setup(opts)

        local ft = require("Comment.ft")
        ft.set('python', {'#%s', '"""%s"""'})
    end
}
