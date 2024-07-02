return {
    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    --
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "pyright",
                "prettier",
                "isort"
            },
        },
    },
    --
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim"
        },
        ft = { "python" },
        opts = function()
            return require "configs.null-ls"
        end,
    },
    --
    --
    {
        "nvim-neotest/nvim-nio",
    },
    {
        "nvim-lua/plenary.nvim"
    },
    {
        "christoomey/vim-tmux-navigator"
    },
    {
        "xiyaowong/virtcolumn.nvim",
        event = "VeryLazy"
    }
}
