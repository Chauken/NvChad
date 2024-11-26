return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- load defaults i.e lua_lsp
      require("nvchad.configs.lspconfig").defaults()
      local lspconfig = require "lspconfig"
      local servers = { "html", "cssls", "csharp_ls", "pyright" }
      local nvlsp = require "nvchad.configs.lspconfig"

      -- set dotnet_root in the environment
      vim.fn.setenv("dotnet_root", "/usr/lib/dotnet")

      -- lsps with default config
      for _, lsp in ipairs(servers) do
        if lsp == "csharp_ls" then
          lspconfig[lsp].setup {
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
            cmd = { "/home/mabi/.local/share/nvim/mason/packages/csharp-language-server/csharp-ls" },
            filetypes = { "cs", "csx" },
            root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"),
            cmd_env = {
              dotnet_root = "/usr/lib/dotnet"
            }
          }
        else
          lspconfig[lsp].setup {
            on_attach = nvlsp.on_attach,
            on_init = nvlsp.on_init,
            capabilities = nvlsp.capabilities,
          }
        end
      end
    end,
  },
} 