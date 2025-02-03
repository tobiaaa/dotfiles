vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
    change_detection = {
            notify = false,
        }
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

vim.opt.termguicolors = true
vim.opt.colorcolumn = {80,100}
vim.opt.foldmethod = "manual"
vim.opt.timeoutlen = 1000

vim.env.NVIM = "1"

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- load bbye
local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin')

if not ok then
    vim.cmd 'colorscheme default'
end

