-- Add this to your lazy plugin configuration
return {
  {
    'tpope/vim-dadbod',
    dependencies = {
      'kristijanhusak/vim-dadbod-ui',
      'kristijanhusak/vim-dadbod-completion',
      'prettier/vim-prettier',
    },
    lazy = false,
    keys = {
      -- Open DBUI sidebar
      { '<leader>db', '<cmd>DBUI<CR>', desc = 'Open Database UI' },
    },
    config = function()
      -- Optional: Add any additional DBUI configuration here
      vim.g.db_ui_save_location = vim.fn.stdpath 'data' .. '/db_ui'
      vim.g.db_ui_use_nerd_fonts = 1

      -- Set filetype to javascript.mongodb for MongoDB query buffers
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'mongodb' },
        callback = function()
          vim.bo.filetype = 'javascript.mongodb'
          -- Enable JavaScript/JSON completion
          vim.schedule(function()
            require('cmp').setup.buffer {
              sources = {
                { name = 'nvim_lsp' },
                { name = 'buffer' },
                { name = 'path' },
              },
            }
          end)
        end,
      })
    end,
  },
}
