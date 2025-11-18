-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "texlab" , "bashls" , "matlab_ls", "marksman"}

-- lsps with default config
for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {})
  vim.lsp.enable(lsp)
end

-- Python with custom settings
vim.lsp.config('pyright', {
  filetypes = { "python" },
})
vim.lsp.enable('pyright')
