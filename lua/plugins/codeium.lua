return {
  {
    "Exafunction/codeium.vim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "BufEnter",
    lazy = false,
    config = function()
      require "configs.codeium"
    end,
  },
} 
