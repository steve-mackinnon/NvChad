return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },

  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles", "DiffviewFileHistory" },
    opts = {},
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "mason-org/mason.nvim",
    event = "VeryLazy", -- load at startup so ensure_installed runs
    opts = function()
      local opts = require "nvchad.configs.mason" -- nvchad ui/defaults
      opts.ensure_installed = {
        "lua-language-server", "stylua",
        "html-lsp", "css-lsp", -- html, cssls
        "typescript-language-server",
        "gopls",
      }
      return opts
    end,
    config = function(_, opts)
      require("mason").setup(opts)

      -- mason 2.0 core has no ensure_installed; install missing packages
      local registry = require "mason-registry"
      registry.refresh(function()
        for _, name in ipairs(opts.ensure_installed or {}) do
          local ok, pkg = pcall(registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css",
        "javascript", "typescript", "tsx",
        "go", "gomod", "gosum", "gotmpl",
      },
    },
  },
}
