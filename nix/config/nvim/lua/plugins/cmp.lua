return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp_ok, cmp = pcall(require, "cmp")
    if not cmp_ok then
      vim.notify("nvim-cmp not found", vim.log.levels.WARN)
      return
    end

    local luasnip_ok, luasnip = pcall(require, "luasnip")
    if not luasnip_ok then
      luasnip = nil
    end

    -- setup cmp
    cmp.setup({
      snippet = {
        expand = function(args)
          if luasnip then
            luasnip.lsp_expand(args.body)
          end
        end,
      },
      -- visual tweaks: smaller/truncated labels and transparent popup
      window = {
        completion = cmp.config.window.bordered({
          -- make popup compact
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None",
          side_padding = 0,
        }),
        documentation = cmp.config.window.bordered({
          winhighlight = "Normal:CmpPmenu,CursorLine:CmpPmenuSel,Search:None",
          max_height = 6,
        }),
      },
      mapping = {
        ["<C-j>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-k>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm({ select = true })
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          -- only use Tab for snippet expansion/jump; do not navigate completion menu
          if luasnip and luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip and luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        (luasnip and { name = "luasnip" }) or nil,
        { name = "path" },
      }, {
        { name = "buffer" },
      }),
      experimental = { ghost_text = true },
      -- limit label width to keep popup compact and shorten source menu
      formatting = {
        format = function(entry, vim_item)
          local max_width = 28
          if vim_item.abbr and #vim_item.abbr > max_width then
            vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 3) .. "..."
          end
          local source_names = {
            nvim_lsp = "[LSP]",
            luasnip = "[SNIP]",
            buffer = "[BUF]",
            path = "[PATH]",
          }
          vim_item.menu = source_names[entry.source.name] or ""
          return vim_item
        end,
      },
    })

    -- Use buffer source for `/` (if you want search completion)
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':'
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
    })

    -- If LSP capabilities were prepared earlier, ensure clients use them when set up.
    -- Many server setup files will pick up vim.g.lsp_capabilities if they reference it.
    -- create transparent highlight groups for cmp popup
    pcall(function()
      -- set background to NONE so floating window is transparent
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = "NONE" })
      -- keep selection highlighted by linking to PmenuSel (so selection remains visible)
      vim.api.nvim_set_hl(0, "CmpPmenuSel", { link = "PmenuSel" })
    end)
  end,
}
