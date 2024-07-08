local utils = require "custom.utils"
local base = require "plugins.configs.lspconfig"
local on_attach = base.on_attach
local capabilities = base.capabilities

local lsp_util = require "lspconfig/util"
local lspconfig = require "lspconfig"

local clangdCapabilities = utils.copy_table(base.capabilities)
clangdCapabilities.offsetEncoding = "utf-16"

lspconfig.clangd.setup {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--background-index",
    "--completion-style=bundled",
    "--header-insertion=iwyu",
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.signatureHelpProvider = false
    -- require("clangd_extensions.inlay_hints").setup_autocmd()
    -- require("clangd_extensions.inlay_hints").set_inlay_hints()
    on_attach(client, bufnr)
  end,
  capabilities = clangdCapabilities,
}

-- lspconfig.rust_analyzer.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "rust" },
--   root_dir = lsp_util.root_pattern("Cargo.toml", "Cargo.lock"),
--   settings = {
--     ["rust-analyzer"] = {
--       cargo = {
--         allFeatures = true,
--       },
--     },
--   },
-- }

lspconfig.elixirls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/Users/steve/bin/elixir-ls/language_server.sh" },
}

lspconfig.clojure_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  { "clojure", "edn", "cljs" },
}

local servers = {
  "angularls",
  "cmake",
  "cssls",
  "elmls",
  "tsserver",
  "html",
  "pylsp",
  "svelte",
  "vimls",
  "gopls",
  "pylsp",
  "tailwindcss",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
