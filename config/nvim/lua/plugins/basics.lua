return {
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = { 'pylsp', 'clangd', 'superhtml', 'lua_ls', 'kotlin_lsp', 'jsonls', 'rust_analyzer', 'cssls' },
    },
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      {
        "neovim/nvim-lspconfig",
        config = function()
          local opts = { noremap = true, silent = true }
          -- Use an on_attach function to only map the following keys
          -- after the language server attaches to the current buffer
          local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
              opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
              '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
          end

          -- Use a loop to conveniently call 'setup' on multiple servers and
          -- map buffer local keybindings when the language server attaches
          local servers = { 'pylsp', 'clangd', 'superhtml', 'lua_ls', 'kotlin_lsp', 'jsonls', 'cssls' }
          for _, lsp in pairs(servers) do
            vim.lsp.config(lsp, {
              on_attach = on_attach,
            })
            vim.lsp.enable(lsp)
          end

          -- custom settngs for rust-analyzer
          vim.lsp.config('rust_analyzer', {
            on_attach = on_attach,
            settings = {
              ["rust-analyzer"] = {
                check = {
                  allTargets = false,
                  command = "clippy"
                }
              }
            }
          })
          vim.lsp.enable('rust_analyzer')
        end
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "c",
          "lua",
          "rust",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
        },
      })
    end,
    build = ":TSUpdate",
  },
  {
    "tpope/vim-sleuth"
  },
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.nvim",
    },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    'echasnovski/mini.nvim',
    version = '*'
  },
}
