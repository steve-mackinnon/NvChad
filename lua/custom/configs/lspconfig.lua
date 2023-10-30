local base = require("plugins.configs.lspconfig")
local on_attach = base.on_attach
local capabilities = base.capabilities
local clangdCapabilities = base.capabilities
clangdCapabilities.offsetEncoding = 'utf-16'

local lspconfig = require("lspconfig")
lspconfig.clangd.setup {
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    on_attach(client, bufnr)
  end,
  capabilities = clangdCapabilities,
}
lspconfig.tsserver.setup {
  root_dir = lspconfig.util.root_pattern('.git'),
  on_attach = on_attach,
  capabilities = capabilities,
}
