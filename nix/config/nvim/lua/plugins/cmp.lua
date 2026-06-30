return {
  {
    "saghen/blink.cmp",
    branch = "v1",

    dependencies = {
      "rafamadriz/friendly-snippets",
    },

    opts = {

      completion = {
        documentation = {
          auto_show = true,
        },
      },


      sources = {
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
        },
      },


      keymap = {
        preset = "default",

        ["<C-j>"] = {
          "select_next",
          "snippet_forward",
          "fallback",
        },

        ["<C-k>"] = {
          "select_prev",
          "snippet_backward",
          "fallback",
        },

        ["<CR>"] = {
          "accept",
          "fallback",
        },
      },

    },
  },
}
