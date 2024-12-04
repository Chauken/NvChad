return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  dependencies = {
    'MunifTanjim/nui.nvim',
    'rcarriga/nvim-notify',
  },
  lazy = false,
  config = function()
    require('noice').setup {
      cmdline = {
        view = 'cmdline_popup', 
        opts = {
          border = {
            style = 'rounded',
          },
        },
      },
      lsp = {
        signature = {
          enabled = false
        }
      },
      -- Add these settings to handle fast events better
      views = {
        mini = {
          win_options = {
            winblend = 0
          }
        }
      },
      -- Disable features that might trigger during fast events
      messages = {
        enabled = true,
        view_search = false,  -- disable search messages
      },
      -- Add smart throttling
      throttle = 1000 / 30,  -- 30fps
      routes = {
        -- Skip displaying certain messages during fast operations
        {
          filter = {
            event = "msg_show",
            kind = { "search_count", "wmsg" },
          },
          opts = { skip = true },
        },
      },
    }
  end,
}
