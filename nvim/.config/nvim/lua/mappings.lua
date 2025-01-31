require "nvchad.mappings"

-- add yours here
vim.g.mapleader = " "
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
map("i", "jk", "<Esc>", { desc = "Exit insert mode" })

-- Code Wrap
map("n", "<M-z>", "<cmd>set wrap!<CR>", { desc = "Toggle wrap" })

-- Increment/Decrement numbers
map("n", "<leader>+", "<C-a>", { desc = "Increment Number" })
map("n", "<leader>-", "<C-x>", { desc = "Decrement Number" })

-- New line
map("n", "<Enter>", "o<Esc>", { desc = "Insert new line below current" })
map("n", "<leader><Enter>", "O<Esc>", { desc = "Insert new line above current" })

-- Window Management
map("n", "<leader>sv", "<C-w>v", { desc = "Split Window Vertically" })
map("n", "<leader>sh", "<C-w>s", { desc = "Split Window Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>wh", "<C-w>h", { desc = "Focus left window" })
map("n", "<leader>wl", "<C-w>l", { desc = "Focus right window" })
map("n", "<leader>wj", "<C-w>j", { desc = "Focus lower window" })
map("n", "<leader>wk", "<C-w>k", { desc = "Focus upper window" })

map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
map("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

map("n", "<leader>q", "<cmd>Bdelete<CR>", { desc = "Close current buffer" })
map("n", "<leader>Q", "<cmd>Bdelete!<CR>", { desc = "Force close current buffer" })

-- LSP
map("n", "<leader>ds", "<cmd>lua vim.diagnostic.open_float()<CR>", { desc = "Show diagnostic info" })
map("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename variable" })
map("n", "<leader>fm", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 2000 })<CR>", { desc = "General Format" })
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to definition" })

-- Util
map("n", "<leader>dp", "<cmd>echo expand('%:p')<CR>", { desc = "Show current path" })
map("t", "jk", "<C-\\><C-n>", { desc = "Show current path" })

-- Spellcheck
map("n", "cs", "i<C-X>s", { desc = "Show spelling suggestions" })

-- Session
map("n", "<leader>sl", function() require("persistence").select() end, { desc = "Load session" })
