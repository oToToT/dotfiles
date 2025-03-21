return {
  {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/vim-vsnip",
    },
    opts = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end
        },
        mapping = {
          ["<CR>"] = cmp.mapping.confirm({select = false}),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Up>"] = cmp.mapping.select_prev_item({behavior = "select"}),
          ["<Down>"] = cmp.mapping.select_next_item({behavior = "select"}),
          ["<Tab>"] = cmp.mapping.select_next_item({behavior = "select"}),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" }
        }, {
          { name = "buffer" }
        })
      })

      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
        }, {
          { name = 'buffer' },
        })
      })

      cmp.setup.cmdline('/', {
        sources = {
          { name = 'buffer' }
        }
      })

      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end,
  }
}
