return {
  {
    'unblevable/quick-scope',
    lazy = false,
    init = function()
      vim.g.qs_enable = 1
      vim.cmd [[
        highlight QuickScopePrimary guifg='#f9e2af' gui=bold,underline,nocombine guisp='#f9e2af' gui=undercurl ctermfg=Yellow cterm=bold,underline
        highlight QuickScopeSecondary guifg='#f38ba8' gui=underline,nocombine guisp='#f38ba8' gui=undercurl ctermfg=Red cterm=underline
      ]]
    end,
  },
}
