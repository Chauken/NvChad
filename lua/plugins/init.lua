return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- Add this dependency
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    lazy = false,
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
            "html", "css","python","c_sharp"
  		},
  	},
  },
{
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
        local cmp = require("cmp")
        local cmp_config = require("configs.cmp")
        cmp.setup(cmp_config)
    end,
},



    {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = "Mason",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- You can add your required tools here
        "lua-language-server",
        "stylua",
        "pyright",
        "black",
        "mypy",
        "ruff",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      local function ensure_installed()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end
      if mr.refresh then
        mr.refresh(ensure_installed)
      else
        ensure_installed()
      end
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
      })
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
{
    'milanglacier/minuet-ai.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'hrsh7th/nvim-cmp'
    },
    config = function()
        require('minuet').setup({
            default_provider = 'openai',
            provider_options = {
                openai = {
                    model = 'gpt-4o-mini',
                    system = {
                        prompt = function()
                            return [[You are a programming expert. When given a comment or request, provide appropriate code implementation. Keep responses concise and focused. Use common libraries and best practices where appropriate. Don't explain the code unless asked.]]
                        end,
                    },
                    few_shots = function()
                        return require('minuet.config').default_few_shots
                    end,
                    stream = true,
                    optional = {
                        max_tokens = 256,
                    },
                },
            },
        })
    end
}



}
