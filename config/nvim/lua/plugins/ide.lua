return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
    keys = {
      {
        "<Leader>nn",
        "<Cmd>NvimTreeToggle<CR>",
        desc = "NvimTreeToggle"
      },
    }
  },
  {
    "editorconfig/editorconfig-vim"
  },
  {
    "Raimondi/delimitMate"
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<Leader>ff",
        "<Cmd>Telescope find_files<CR>",
        desc = "Telescope find files"
      },
      {
        "<Leader>fg",
        "<Cmd>Telescope live_grep<CR>",
        desc = "Telescope live grep"
      },
      {
        "<Leader>fb",
        "<Cmd>Telescope buffers<CR>",
        desc = "Telescope buffers"
      },
      {
        "<Leader>fh",
        "<Cmd>Telescope help_tags<CR>",
        desc = "Telescope help tags"
      },
    },
  },
  {
    "github/copilot.vim"
  }
}
