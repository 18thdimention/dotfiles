return {
  "saghen/blink-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    -- attempt to require the blink plugin under a few possible module names
    local tries = { "blink.cmp", "blink-cmp", "blink_cmp", "blink" }
    local blink_mod
    local errors = {}
    for _, name in ipairs(tries) do
      local ok, res = pcall(require, name)
      if ok and res then
        blink_mod = res
        break
      end
      if not ok and type(res) == "string" then
        table.insert(errors, name .. ": " .. res)
      end
    end

    if not blink_mod then
      vim.notify("blink-cmp plugin not found or failed to load. Attempts:\n" .. table.concat(errors, "\n"), vim.log.levels.WARN)
    else
      -- blink_mod may expose a submodule 'cmp' or provide setup directly
      local setup_target = blink_mod.setup or (blink_mod.cmp and blink_mod.cmp.setup)
      if not setup_target then
        vim.notify("blink-cmp loaded but no setup() found on module", vim.log.levels.WARN)
      else
        setup_target({
      keymap = { preset = "enter" },
      cmdline = {
        keymap = { preset = "super-tab" },
        completion = { menu = { auto_show = true } },
      },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            -- make lazydev completions top priority (see `:h blink.cmp`)
            score_offset = 100,
          },
        },
      },
      -- completion menu behavior
      completion = {
        list = { selection = { auto_insert = true } }, -- inserts potential selection when scrolling through list
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
          },
        },
        menu = {
          border = "rounded",
          -- how the items are drawn (shown) in the menu, example below
          -- [LSP]  ctx.source_name  kind_icon  kind
          draw = {
            gap = 2,
            components = {
              source_name = {
                text = function(ctx)
                  if ctx.source_name == "LSP" then return "[LSP]" end
                  if ctx.source_name == "Snippets" then return "[SNIP]" end
                  if ctx.source_name == "Buffer" then return "[BUF]" end
                  if ctx.source_name == "Path" then return "[PATH]" end
                end,
              },
            },
            -- add padding between various completion elements (purely cosmetic)
            columns = {
              { "source_name", gap = 1 },
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind", gap = 2 },
            },
          },
        },
      },
      })
    end

    -- set keymaps for nvim-cmp as well (safe-guard if cmp is installed)
    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp and cmp then
      local mapping = cmp.mapping
      cmp.setup({
        mapping = {
          ["<C-j>"] = mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-k>"] = mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-CR>"] = mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      })
    end
  end,
}
