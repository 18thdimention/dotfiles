local function transparent(theme)
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = theme,
    callback = function()
      local groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "SignColumn",
        "MsgArea",
        "NeoTreeNormal",
        "NeoTreeNormalNC",
      }
      for _, group in ipairs(groups) do
        vim.cmd("highlight " .. group .. " ctermbg=none guibg=none")
      end
    end,
  })
end

return {
  {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        transparent = true,
      })
      transparent("kanagawa")
      -- Ensure various UI backgrounds stay transparent when Kanagawa is applied
    end,
  },
  {
    "shaunsingh/nord.nvim",
    config = function()
      vim.g.nord_disable_background = false
      require("nord").set()
      transparent("nord")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
