return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
        "latex-lsp/tree-sitter-latex"
    },
    config = function()
        local treesitter = require("nvim-treesitter.configs")

        treesitter.setup({
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
            autotag = {
                enable = true
            },
            ensure_installed = {
                "json",
                "yaml",
                "markdown",
                "bash",
                "python",
                "gitignore",
                "lua",
                "latex",
                "markdown",
                "markdown_inline"
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<M-s>",
                    node_incremental = "<M-k>",
                    scope_incremental = "<M-n>",
                    node_decremental = "<M-j>",
                }
            }
        })
    end
}
