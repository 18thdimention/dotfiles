return {
 "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    local disable_markdown = vim.fn.has("nvim-0.12") == 1

    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      local_parsers = {
        norg = {
          source = {
            type = "self_contained",
            url = "https://github.com/nvim-neorg/tree-sitter-norg",
            semver = false,
            queries_path = "queries",
          },
          filetypes = { "norg" },
        },
        norg_meta = {
          source = {
            type = "self_contained",
            url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
            semver = false,
            queries_path = "queries",
          },
          filetypes = { "norg_meta" },
        },
      },
      highlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
        "cpp",
        "gdscript",
        "gdshader",
        "godot_resource",
				"rust",
				"norg",
				"norg_meta",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
