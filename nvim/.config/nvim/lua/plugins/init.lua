return {
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    opts = {
      format = { timeout_ms = 5000 },
    },
  },
  --
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "pyright",
        "prettier",
        "isort",
        "bash-language-server",
        "texlab",
      },
    },
  },
  --
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
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
    "nvim-lua/plenary.nvim",
  },
  {
    "xiyaowong/virtcolumn.nvim",
    event = "VeryLazy",
  },
  {
    "wintermute-cell/gitignore.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Gitignore",
    config = function()
      require "gitignore"
    end,
  },
  {
    "moll/vim-bbye",
    event = "VeryLazy",
  },
}
