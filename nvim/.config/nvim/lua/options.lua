require "nvchad.options"

-- add yours here!
vim.cmd("let g:netrw_liststyle = 3")
-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4 -- 4 spaces for tabs
opt.shiftwidth = 4 -- 4 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.signcolumn = "yes"

-- split windows
opt.splitright = true
opt.splitbelow = true

-- DiffOrig
vim.api.nvim_create_user_command('DiffOrig', function()
      local scratch_buffer = vim.api.nvim_create_buf(false, true)
      local current_ft = vim.bo.filetype
      vim.cmd('vertical sbuffer' .. scratch_buffer)
      vim.bo[scratch_buffer].filetype = current_ft
      vim.cmd('read ++edit #') -- load contents of previous buffer into scratch_buffer
      vim.cmd.normal('1G"_d_') -- delete extra newline at top of scratch_buffer without overriding register
      vim.cmd.diffthis() -- scratch_buffer
      vim.cmd.wincmd('p')
      vim.cmd.diffthis() -- current buffer
end, {})
