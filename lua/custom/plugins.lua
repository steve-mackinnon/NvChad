local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "angular-language-server",
        "clangd",
        "clang-format",
        "clojure-lsp",
        "cmake-language-server",
        "codelldb",
        "cpptools",
        "css-lsp",
        "elm-language-server",
        "elm-format",
        "gopls",
        "prettier",
        "rust-analyzer",
        "shellcheck",
        "svelte-language-server",
        "stylua",
        "ts-standard",
        "typescript-language-server",
        "vim-language-server",
      },
    },
  },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("typescript-tools").setup()
    end,
    -- lazy = false,
  },
  {
    "folke/trouble.nvim",
    branch = "dev",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      win = {
        position = "right",
      },
    },
    lazy = false,
  },
  {
    "Civitasv/cmake-tools.nvim",
    opts = {
      cmake_generate_options = { "-G Ninja" },
    },
    dependencies = "nvim-lua/plenary.nvim",
    lazy = false,
  },
  {
    "carbon-steel/detour.nvim",
    config = function()
      vim.keymap.set("n", "<c-w><enter>", ":Detour<cr>")
    end,
  },
  {
    "almo7aya/openingh.nvim",
    opts = {},
    lazy = false,
  },
  {
    "nmac427/guess-indent.nvim",
    config = function()
      require("guess-indent").setup {
        auto_cmd = true,
        override_editorconfig = true,
      }
    end,
    lazy = false,
  },
  -- install without yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  { "Olical/conjure", lazy = false },
  { "kazhala/close-buffers.nvim", lazy = false },
  { "p00f/clangd_extensions.nvim", lazy = true },
}

return plugins
