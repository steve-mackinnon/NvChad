local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "clangd",
      "clang-format",
    }
  }
}

return plugins
