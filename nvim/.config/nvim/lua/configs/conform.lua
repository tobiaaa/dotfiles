local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    -- css = { "prettier" },
    -- html = { "prettier" },
    python = { "autopep8" },
    bash = { "shfmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 5000,
    lsp_fallback = true,
  },

  format = {
    timeout_ms = 5000,
    lsp_fallback = true,
    async = true,
  },
}

require("conform").setup(options)
