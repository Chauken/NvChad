return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    opts = require "configs.conform",
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
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
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
        "c_sharp",
      },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    priority = 1, -- High priority to ensure it loads early
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      -- "TmuxNavigatePrevious",
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
      local cmp = require "cmp"
      local cmp_config = require "configs.cmp"
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
        "lua-language-server",
        "stylua",
        "ruff-lsp",
        "black",
        "mypy",
        "ruff",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require "mason-registry"
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
      require("mason-lspconfig").setup {
        automatic_installation = true,
      }
    end,
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  -- {
  --   "milanglacier/minuet-ai.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "hrsh7th/nvim-cmp",
  --   },
  --   config = function()
  --     require("minuet").setup {
  --       default_provider = "openai",
  --       provider_options = {
  --         openai = {
  --           model = "gpt-4o-mini",
  --           system = {
  --             prompt = function()
  --               return [[You are a programming expert. When given a comment or request, provide appropriate code implementation. Keep responses concise and focused. Use common libraries and best practices where appropriate. Don't explain the code unless asked.]]
  --             end,
  --           },
  --           few_shots = function()
  --             return require("minuet.config").default_few_shots
  --           end,
  --           stream = true,
  --           optional = {
  --             max_tokens = 256,
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false,
    opts = require "configs.avante", -- This line connects to your config file
    build = "make", -- Use "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" for Windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
      "zbirenbaum/copilot.lua",
      {
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            use_absolute_path = true,
          },
        },
      },
      {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
}
