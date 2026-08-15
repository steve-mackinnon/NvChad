require("nvchad.configs.lspconfig").defaults()

-- Give hover documentation its own high-contrast background without changing
-- other floating windows such as completion menus or Telescope.
local function set_hover_highlights()
  vim.api.nvim_set_hl(0, "LspHoverNormal", { fg = "#bfc6d4", bg = "#0D0C16" })
  vim.api.nvim_set_hl(0, "LspHoverBorder", { fg = "#89B4FA", bg = "#0D0C16" })
end

set_hover_highlights()
vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("LspHoverHighlights", { clear = true }),
  callback = set_hover_highlights,
})

local open_floating_preview = vim.lsp.util.open_floating_preview
vim.lsp.util.open_floating_preview = function(contents, syntax, opts)
  local is_hover = opts and opts.focus_id == "textDocument/hover"
  if is_hover then
    opts = vim.tbl_extend("force", {}, opts, { border = "double" })
  end

  local bufnr, winid = open_floating_preview(contents, syntax, opts)

  if is_hover then
    vim.wo[winid].winhighlight =
      "Normal:LspHoverNormal,NormalFloat:LspHoverNormal,FloatBorder:LspHoverBorder,SignColumn:LspHoverNormal"
    vim.wo[winid].signcolumn = "yes:1"

    local width = vim.api.nvim_win_get_width(winid)
    vim.api.nvim_win_set_width(winid, math.min(width + 4, vim.o.columns - 2))
  end

  return bufnr, winid
end

local servers =
  { "html", "cssls", "gopls", "pyright", "ts_ls", "sqlls", "terraformls", "clangd", "rust_analyzer", "janet_lsp" }
vim.lsp.enable(servers)

vim.filetype.add({ filename = { ["Tiltfile"] = "tiltfile" } })
vim.treesitter.language.register("starlark", "tiltfile")

-- janet_simple parser handles the janet filetype
vim.treesitter.language.register("janet_simple", "janet")

vim.lsp.config("tilt", {
  cmd = { "tilt", "lsp", "start" },
  filetypes = { "tiltfile" },
  root_markers = { "Tiltfile", ".git" },
})
vim.lsp.enable("tilt")

-- read :h vim.lsp.config for changing options of lsp servers 
