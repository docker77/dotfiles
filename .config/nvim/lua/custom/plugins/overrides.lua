-- /lua/custom/plugins/configs.lua file

local M = {}

-- local tree_cb = pcall(require("nvimtree")).nvim_tree_callbac
-- local tree_cb = require("nvim-tree.config").nvim_tree_callback
M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "bash",
    "lua",
    "tsx",
    "typescript",
  },
}
M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

M.nvimtree = {
  filters = {
    dotfiles = true,
    custom = { "node_modules" },
  },
  git = {
    enable = true,
    -- ignore = false,
  },
  renderer = {
    icons = {
      show = {
        git = true,
      },
      -- disable = false,
    },
  },
  view = {
    -- nvim_tree_highlight_opened_files = 1,
    width = 25,
    hide_root_folder = false,
    mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
      custom_only = false,
      -- list of mappings to set on the tree manually
      -- list = {
      --    { key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
      --    { key = "h", cb = tree_cb "close_node" },
      --    { key = "v", cb = tree_cb "vsplit" },
      -- },
    },
  },
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

M.indentblankline = {
  space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = false,
}

-- local present, cmp = pcall(require, "cmp")
M.cmp = {
  mapping = {

    ["<Tab>"] = function(fallback)
      -- if cmp.visible() then
      --    cmp.select_next_item()
      -- else
      local copilot_keys = vim.fn["copilot#Accept"]()
      if copilot_keys ~= "" then
        vim.api.nvim_feedkeys(copilot_keys, "i", true)
      else
        fallback()
      end
      -- end
    end,
    --    ["<C-e>"] = function(fallback)
    --       cmp.mapping.abort()
    --       local copilot_keys = vim.fn["copilot#Accept"]()
    --       if copilot_keys ~= "" then
    --          vim.api.nvim_feedkeys(copilot_keys, "i", true)
    --       else
    --          fallback()
    --       end
    --    end,
  },

  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = entry:get_completion_item().detail
      return vim_item
    end,
  },
}
return M
