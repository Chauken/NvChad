return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      cmdline = {
        enabled = true,
        view = 'cmdline_popup', -- use cmdline_popup for that nice UI
        opts = {
          border = {
            style = 'rounded',
          },
        },
      },
      -- Add LSP configuration to disable signature
      lsp = {
        signature = {
          enabled = false
        }
      }
    }
  end,
}
