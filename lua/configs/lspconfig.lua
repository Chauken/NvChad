-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local servers = { "html", "cssls", "python", "csharp_ls", "ruff_lsp" }
local nvlsp = require "nvchad.configs.lspconfig"

-- Set DOTNET_ROOT in the environment
vim.fn.setenv("DOTNET_ROOT", "/usr/lib/dotnet")

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
        DOTNET_ROOT = "/usr/lib/dotnet"
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
;
