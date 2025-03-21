vim.opt["number"] = true
vim.opt["fsync"] = true
vim.opt["hlsearch"] = true
vim.opt["mouse"] = ""

vim.g.mapleader = ","
vim.api.nvim_set_keymap("n", "<Leader>u", "<Cmd>set invnumber<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>c<Space>", "gc<space>", {})
vim.api.nvim_set_keymap("v", "<Leader>c<Space>", "gc", {})
vim.api.nvim_set_keymap("n", "<Leader>w", "<Cmd>w!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>set invpaste<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>d", "<Cmd>let @/=''<CR>", { noremap = true })

require("config.lazy")
