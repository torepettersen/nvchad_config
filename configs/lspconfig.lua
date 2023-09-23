local configs = require "plugins.configs.lspconfig"
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"

lspconfig.elixirls.setup {
  cmd = { os.getenv "HOME" .. "/.elixir_ls/language_server.sh" },
  settings = {
    elixirLS = {
      dialyzerEnabled = false,
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
}
