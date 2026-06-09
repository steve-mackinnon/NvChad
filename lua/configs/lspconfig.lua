require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "gopls", "pyright", "ts_ls", "sqlls", "terraformls" }
vim.lsp.enable(servers)

vim.filetype.add({ filename = { ["Tiltfile"] = "tiltfile" } })
vim.treesitter.language.register("starlark", "tiltfile")

vim.lsp.config("tilt", {
  cmd = { "tilt", "lsp", "start" },
  filetypes = { "tiltfile" },
  root_markers = { "Tiltfile", ".git" },
})
vim.lsp.enable("tilt")

-- read :h vim.lsp.config for changing options of lsp servers 
