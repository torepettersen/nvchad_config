local lspconfig = require "lspconfig"
local configs = require "lspconfig.configs"

local nvchad_configs = require "plugins.configs.lspconfig"
local on_attach = nvchad_configs.on_attach
local capabilities = nvchad_configs.capabilities

local elixir = require "elixir"
local elixirls = require "elixir.elixirls"

local lsp_server = "elixirls"

local M = {}

M.setup = function()
  elixir.setup {
    nextls = { enable = false },
    credo = { enable = false },
    elixirls = {
      enable = lsp_server == "elixirls",
      cmd = { os.getenv "HOME" .. "/.elixir_ls/language_server.sh" },
      settings = elixirls.settings {
        dialyzerEnabled = false,
        enableTestLenses = false,
      },
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        require("core.utils").load_mappings("elixir", { buffer = bufnr })
      end,
      capabilities = capabilities,
    },
  }

  if lsp_server == "lexical" then
    configs.lexical = {
      default_config = {
        filetypes = { "elixir", "eelixir" },
        cmd = { os.getenv "HOME" .. "/.lexical/bin/start_lexical.sh" },
        root_dir = function(fname)
          return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
        end,
      },
    }

    lspconfig.lexical.setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

return M
