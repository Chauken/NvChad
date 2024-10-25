return {
  {
    'unblevable/quick-scope',
    lazy = false,  -- Load on startup for immediate effect
    init = function()
      -- Remove the qs_highlight_on_keys setting to make it always show
      vim.g.qs_enable = 1  -- Enable the plugin
      -- Set primary and secondary colors for quick-scope
      vim.cmd [[
        highlight QuickScopePrimary guifg='#ff0000' gui=underline ctermfg=Red cterm=underline
        highlight QuickScopeSecondary guifg='#ff4444' gui=underline ctermfg=Red cterm=underline
      ]]
    end,
  },
}
