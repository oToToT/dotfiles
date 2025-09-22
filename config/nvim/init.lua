require("config.options")
require("config.keymaps")
require("config.lazy")
vim.api.nvim_create_autocmd("VimEnter", { callback = function() require "lazy".update({ show = false }) end })
