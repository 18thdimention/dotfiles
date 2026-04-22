return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      -- Disable Copilot's default <Tab> mapping to avoid conflicts with nvim-cmp/LSP
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""

      -- Use <C-J> in insert mode to accept Copilot suggestions
      vim.keymap.set(
        "i",
        "<C-J>",
        'copilot#Accept("<CR>")',
        { silent = true, expr = true, replace_keycodes = false, desc = "Copilot accept suggestion" }
      )
    end,
  },
}
