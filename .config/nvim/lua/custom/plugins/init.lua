local overrides = require "custom.plugins.overrides"

return {
  ["kyazdani42/nvim-tree.lua"] = { override_options = overrides.nvimtree },
  ["lukas-reineke/indent-blankline.nvim"] = { override_options = overrides.indentblankline },
  ["hrsh7th/nvim-cmp"] = { override_options = overrides.cmp },
  ["aserowy/tmux.nvim"] = {
    config = function()
      require("tmux").setup()
    end,
  },
  ["NvChad/ui"] = {
    override_options = {
      status = {
        colorizer = true,
      },
      statusline = {
        separator_style = "block",
      },
    },
  },
  ["nvim-telescope/telescope.nvim"] = {
    override_options = {
      extensions = {
        frecency = {
          show_scores = false,
          show_unindexed = true,
          ignore_patterns = { "*.git/*", "*/tmp/*" },
          disable_devicons = false,
          workspaces = {
            ["nvim"] = "/home/rustam/.config/nvim/",
            ["data"] = "/home/rustam/.local/share",
            ["project"] = "/home/rustam/Projects",
            ["wiki"] = "/home/rustam/wiki",
          },
        },
      },
      defaults = {
        -- layout_strategy = "vertical",
        path_display = { shorten = { len = 5, exclude = { -2, -1 } } },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.4,
            results_width = 0.8,
          },
          vertical = {
            prompt_position = "top",
            mirror = true,
          },
        },
      },
      pickers = {
        lsp_definitions = {
          fname_width = 0.65,
        },
        lsp_references = {
          fname_width = 0.65,
          -- layout_config = {
          --   width = 0.75,
          --   height = 0.6,
          --   prompt_position = "bottom",
          -- },
        },
      },
    },
  },
  ["kkharji/sqlite.lua"] = {},
  ["nvim-telescope/telescope-frecency.nvim"] = {
    after = "telescope.nvim",
    config = function()
      require("telescope").load_extension "frecency"
    end,
    requires = { "kkharji/sqlite.lua", "nvim-telescope/telescope.nvim" },
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },
  ["ggandor/lightspeed.nvim"] = {},
  -- [ "williamboman/nvim-lsp-installer" ] = {},
  ["github/copilot.vim"] = {},
  -- ["zbirenbaum/copilot.lua"] = {
  --   config = function()
  --     require("copilot").setup()
  --   end,
  -- },
  -- ["zbirenbaum/copilot-cmp"] = {
  --   after = { "copilot.lua" },
  --   config = function()
  --     require("copilot-cmp").setup()
  --   end,
  -- },
  ["nathom/filetype.nvim"] = {},
  ["luukvbaal/stabilize.nvim"] = {
    config = function()
      require("stabilize").setup()
    end,
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.configs.null-ls"
    end,
  },
  -- load it after nvim-lspconfig , since we'll use some lspconfig stuff in the null-ls config!
  ["gpanders/editorconfig.nvim"] = {},
  ["Shatur/neovim-session-manager"] = {},
  ["karb94/neoscroll.nvim"] = {
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    -- setup = function()
    --    require("core.utils").packer_lazy_load "neoscroll.nvim"
    -- end,
  },
  ["jedi2610/nvim-rooter.lua"] = {
    config = function()
      require("nvim-rooter").setup {
        rooter_patterns = { ".git", ".hg", ".svn", "package.json" },
        trigger_patterns = { "*" },
        manual = false,
      }
    end,
  },
}
