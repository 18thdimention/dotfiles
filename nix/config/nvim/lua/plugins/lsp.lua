return {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },

    config = function()

      local capabilities =
        require("blink.cmp").get_lsp_capabilities()


      local servers = {
        clangd = {},

        pyright = {},

        gopls = {},

        rust_analyzer = {},

        tinymist = {},

        ts_ls = {
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
        },

        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = {
                  "vim",
                },
              },
            },
          },
        },
      }


      for server, config in pairs(servers) do
        config.capabilities = capabilities

        vim.lsp.config(server, config)
        vim.lsp.enable(server)
      end


      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)

          local opts = {
            buffer = args.buf,
          }

          vim.keymap.set(
            "n",
            "gd",
            vim.lsp.buf.definition,
            opts
          )

          vim.keymap.set(
            "n",
            "gr",
            vim.lsp.buf.references,
            opts
          )

          vim.keymap.set(
            "n",
            "K",
            vim.lsp.buf.hover,
            opts
          )

          vim.keymap.set(
            "n",
            "<leader>rn",
            vim.lsp.buf.rename,
            opts
          )

          vim.keymap.set(
            "n",
            "<leader>ca",
            vim.lsp.buf.code_action,
            opts
          )

        end,
      })


      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })


      vim.api.nvim_create_autocmd(
        "BufWritePre",
        {
          callback = function(args)
            vim.lsp.buf.format({
              bufnr = args.buf,
              timeout_ms = 2000,
            })
          end,
        }
      )

    end,
  },
}
