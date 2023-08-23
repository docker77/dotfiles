local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      {
        "SmiteshP/nvim-navbuddy",
        dependencies = {
          {
            "utilyre/barbecue.nvim",
            name = "barbecue",
            version = "*",
            dependencies = {
              "SmiteshP/nvim-navic",
              -- "nvim-tree/nvim-web-devicons", -- optional dependency
            },
            opts = {
              -- configurations go here
            },
          },
          { "SmiteshP/nvim-navic", opts = { lsp = { auto_attach = true } } },
          "MunifTanjim/nui.nvim",
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = overrides.telescope,
  },
  {
    "axelvc/template-string.nvim",
    config = function()
      require("template-string").setup {
        filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
        remove_template_string = true,
        restore_quotes = {
          normal = [[']],
          jsx = [["]],
        },
      }
    end,
    ft = { "typescript", "javascript", "typescriptreact", "javascriptreact", "vue" },
    lazy = false,
  },
  {
    "numToStr/Comment.nvim",
    enabled = false,
  },
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup {
        hook = function()
          require("ts_context_commentstring.internal").update_commentstring()
        end,
      }
    end,
    lazy = false,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- { "github/copilot.vim", lazy = false },
  { "Shatur/neovim-session-manager", lazy = false },
  {
    "jedi2610/nvim-rooter.lua",
    lazy = false,

    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git", ".hg", ".svn", "package.json" },
        trigger_patterns = { "*" },
        manual = false,
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    opts = {
      sources = {
        { name = "copilot" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
      },
    },
  },
  {
    "zbirenbaum/copilot-cmp",
    lazy = false,
    dependencies = {
      "zbirenbaum/copilot.lua",
      -- cmd = "Copilot",
      -- event = "InsertEnter",
      config = function()
        require("copilot").setup {
          suggestion = { enabled = false, auto_trigger = false },
          panel = { enabled = false },
        }
      end,
    },
    config = function()
      require("copilot_cmp").setup()
    end,
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
