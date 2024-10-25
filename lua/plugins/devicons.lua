return {
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    config = function()
      require('nvim-web-devicons').setup {
        -- Enable folder icons
        enable_folders = true,
        -- Enable default icons
        default = true,
        -- Override specific file icons (optional)
        override = {
          -- Example of custom icon:
          -- zsh = {
          --   icon = "",
          --   color = "#428850",
          --   name = "Zsh"
          -- }
        },
        -- Enable strict addon checking
        strict = true,
      }
    end,
  },
}
