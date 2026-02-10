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
-- colorcolumn is managed per-window via autocmd below
vim.opt.foldmethod = "manual"
vim.opt.timeoutlen = 1000


vim.env.NVIM = "1"

require "nvchad.autocmds"

-- Set colorcolumn only for programming languages
local programming_fts = {
  "python", "javascript", "typescript", "javascriptreact", "typescriptreact",
  "c", "cpp", "rust", "go", "java", "lua", "ruby", "php", "perl",
  "sh", "bash", "zsh", "vim", "html", "css", "scss", "json", "yaml", "toml",
  "sql", "r", "julia", "kotlin", "swift", "dart", "elixir", "haskell",
  "scala", "clojure", "ocaml", "zig", "nim"
}

-- Convert to set for faster lookup
local programming_fts_set = {}
for _, ft in ipairs(programming_fts) do
  programming_fts_set[ft] = true
end

vim.api.nvim_create_autocmd({ "FileType", "BufWinEnter" }, {
  pattern = "*",
  callback = function()
    vim.schedule(function()
      local ft = vim.bo.filetype
      if programming_fts_set[ft] then
        vim.wo.colorcolumn = "80,100"
      else
        vim.wo.colorcolumn = ""
      end
    end)
  end,
  desc = "Set colorcolumn only for programming languages"
})

vim.schedule(function()
    require "mappings"
end)

local ok, _ = pcall(vim.cmd, 'colorscheme catppuccin')

if not ok then
    vim.cmd 'colorscheme default'
end
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none"})
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none"})
