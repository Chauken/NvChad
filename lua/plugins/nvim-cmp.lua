-- ~/.config/nvim/lua/custom/plugins.lua
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "onsails/lspkind.nvim",
      "Exafunction/codeium.nvim",  -- since you're using codeium
    },
    opts = function()
      return require "configs.cmp"
    end,
  },
}
