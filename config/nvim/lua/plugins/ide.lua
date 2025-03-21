return {
  {
    "preservim/nerdtree",
    config = function()
      vim.api.nvim_set_keymap("n", "<Leader>nn", "<Cmd>NERDTreeToggle<CR>", {})
    end
  },
  {
    "editorconfig/editorconfig-vim"
  },
  {
    "Raimondi/delimitMate"
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
    end
  }
}
