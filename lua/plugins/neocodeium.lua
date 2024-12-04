return {
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
    config = function()
      local neocodeium = require "neocodeium"
      neocodeium.setup({
        -- Keep using LSP for workspace detection
        workspace_root = {
          use_lsp = true,
          -- Add additional root markers
          paths = {
            "/home/mabi/workspace",
            -- ".bzr",
            -- ".git",
            -- ".hg",
            -- ".svn",
            -- ".config",
            -- "_FOSSIL_",
            -- "package.json",
            -- Add any other root markers you want to use
          }
        }
      })
      vim.keymap.set("i", "<A-f>", neocodeium.accept)
    end,
  },
}
