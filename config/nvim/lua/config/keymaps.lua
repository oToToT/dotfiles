vim.api.nvim_set_keymap("n", "<Leader>u", "<Cmd>set invnumber<CR>", {})
vim.api.nvim_set_keymap("n", "<Leader>c<Space>", "gc<space>", {})
vim.api.nvim_set_keymap("v", "<Leader>c<Space>", "gc", {})
vim.api.nvim_set_keymap("n", "<Leader>w", "<Cmd>w!<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>p", "<Cmd>set invpaste<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>d", "<Cmd>let @/=''<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<space>e", "<Cmd>lua vim.diagnostic.open_float()<CR>", {})

vim.api.nvim_create_user_command("ToggleConform", function()
  vim.g.disable_autoformat = not vim.g.disable_autoformat
  print("conform", (vim.g.disable_autoformat and "disabled" or "enabled"))
end, { desc = "Toggle conform.nvim" })
vim.api.nvim_set_keymap("n", "<Leader>a", "<Cmd>:ToggleConform<CR>", {})
