-- Add this to lua/custom/configs/overrides.lua
local M = {}

M.nvimtree = {
  filters = {
    dotfiles = false,
    exclude = { ".git" },
  },
  
  git = {
    enable = true,
    ignore = false,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      
      glyphs = {
        default = "󰈚",
        symlink = "",
        bookmark = "󰆤",
        modified = "●",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "",
          staged = "",
          unmerged = "",
          renamed = "󰁕",
          untracked = "",
          deleted = "",
          ignored = "",
        },
      },
    },
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },

  view = {
    width = 30,
    indent_width = 2,
  },
}

return M

-- Then in lua/custom/plugins.lua
--   "nvim-tree/nvim-tree.lua",
-- {
--   opts = function()
--     return require "custom.configs.overrides".nvimtree
--   end,
--   dependencies = {
--     "nvim-tree/nvim-web-devicons",
--   },
-- }
