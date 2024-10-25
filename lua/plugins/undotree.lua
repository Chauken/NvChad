return {
  'mbbill/undotree',
    lazy = false,  -- This will make it load on startup

  config = function()
    vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
  end,
}
