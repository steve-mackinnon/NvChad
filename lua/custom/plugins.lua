local base = require "plugins.configs.lspconfig"

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
    "nvim-telescope/telescope.nvim",
    config = function()
      require "plugins.configs.telescope"
      require("telescope").load_extension "fzf"
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "angular-language-server",
        "black",
        "clangd",
        -- "clang-format",
        "cljfmt",
        "clojure-lsp",
        "cmake-language-server",
        "codelldb",
        "cpptools",
        "css-lsp",
        "elixir-ls",
        "elm-language-server",
        "elm-format",
        "gopls",
        "html-lsp",
        "lua-language-server",
        "prettier",
        "python-lsp-server",
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
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = { "rust" },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end,
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      win = {
        position = "right",
      },
    },
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
  -- { "Olical/conjure", lazy = false },
  { "kazhala/close-buffers.nvim", lazy = false },
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   lazy = true,
  --   config = function()
  --     require("clangd_extensions").setup {
  --       inlay_hints = {
  --         only_current_line = true,
  --       },
  --     }
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },
}

return plugins
