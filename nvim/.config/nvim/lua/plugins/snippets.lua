return {
  "L3MON4D3/LuaSnip",
  ft = { "python", "tex", "bash", "markdown", "lua" },
  -- follow latest release.
  version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
  -- install jsregexp (optional!).
  build = "make install_jsregexp",

  config = function()
    require("luasnip.loaders.from_snipmate").load { paths = vim.fn.stdpath("config") .. "/snippets" }
  end,
}
