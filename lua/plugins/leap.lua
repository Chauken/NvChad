return {
  'ggandor/leap.nvim',
   dependencies = { 'tpope/vim-repeat' }, -- optional but recommended
   lazy = false,  -- This will make it load on startup
  config = function()
    require('leap').add_default_mappings()
    -- Optional: customize highlight colors
    -- vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    -- vim.api.nvim_set_hl(0, 'LeapMatch', { fg = 'white', bold = true, nocombine = true })
  end,
}
