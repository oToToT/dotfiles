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
  },
  {
    'danro/rename.vim'
  },
  {
    'NMAC427/guess-indent.nvim',
    config = function()
      require("guess-indent").setup {}
    end
  },
  {
    'stevearc/conform.nvim',
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          kotlin = { "ktfmt" },
          javascriptreact = { "prettierd" },
        },
        format_on_save = {
          timeout_ms = 10000,
          lsp_format = "fallback",
        }
      })
    end,
  },
  {
    "FabijanZulj/blame.nvim",
    lazy = false,
    config = function()
      require('blame').setup {}
      vim.api.nvim_set_keymap("n", "<Leader>b", "<Cmd>BlameToggle<CR>", {})
    end,
    opts = {
      mappings = {
        commit_info = "i",
        stack_push = "<TAB>",
        stack_pop = "<S-TAB>",
        show_commit = "<CR>",
        close = { "<esc>", "q" },
      }
    },
  },
}
