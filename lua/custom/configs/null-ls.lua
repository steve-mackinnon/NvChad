local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier,
  formatting.stylua,
  formatting.clang_format,
  lint.shellcheck,
  lint.eslint,
  lint.tsc,
  lint.yamllint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
