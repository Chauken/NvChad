return {
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
} 