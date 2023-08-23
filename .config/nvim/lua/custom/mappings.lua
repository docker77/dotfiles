local M = {}

-- print("mappings")
-- add this table only when you want to disable default keys
M.disabled = {
  n = {
    ["<C-n>"] = {},
    -- ["<tab>"] = {},
    -- ["<C-i>"] = {},
    -- ["<S-tab>"] = {},
  },
}

M.mine = {
  v = {
    ["<leader>/"] = { ":'<,'>CommentToggle<CR>", "" },
  },
  n = {
    ["<leader>q"] = { ":q <CR>", "quit" },
    ["<leader>n"] = { ":Navbuddy <CR>", "Navbuddy" },
    ["<leader>cc"] = { ":Telescope <CR>", "" },
    ["<leader>bl"] = { ":Git blame_line <CR>", "" },
    ["<leader>ba"] = { ":bufdo bd <CR>", "" },
    -- ["<leader>q"] = { ":q <CR>", "" },
    ["<leader>ft"] = { ":NvimTreeToggle <CR>", "" },
    -- ["<leader>fo"] = { ":Telescope frecency <CR>", "" },
    ["<leader>fr"] = { ":Telescope resume <CR>", "" },
    ["<leader>fp"] = { ":Telescope projects <CR>", "" },
    ["<leader>fs"] = { ":Telescope sessions <CR>", "" },
    ["<leader>fW"] = { ":Telescope grep_string <CR>", "" },
    ["<leader>th"] = { ":nohl <CR>", "" },
    ["<leader>tt"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
    ["<leader>tn"] = { ":tabnext <CR>", "Next tab" },
    ["<leader>tp"] = { ":tabprevious <CR>", "Next tab" },
    ["<leader>tw"] = { ":set wrap! <CR>", "" },
    ["<leader>/"] = { "<cmd> CommentToggle <CR>", "" },
    ["U"] = { ":redo <cr>", "" },
    ["gd"] = { ":Telescope lsp_definitions <CR>", "" },
    ["gv"] = { ":vs <CR> :Telescope lsp_definitions <CR>", "" },
    ["gs"] = { ":vs <CR> :Telescope lsp_definitions <CR>", "" },
    ["gr"] = { ":Telescope lsp_references <CR>", "" },
    -- ["<leader>fm"] = { ":lua vim.lsp.buf.format { async = true }<CR>", "" },
    ["<C-TAB>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "  cycle next buffer",
    },
    ["<C-S-TAB>"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
      end,
      "  cycle prev buffer",
    },
    ["<leader>dd"] = { ":Telescope diagnostics bufnr=0 <CR>", "" },
    ["<leader>da"] = { ":Telescope diagnostics <CR>", "" },
    ["<leader>d"] = {
      function()
        vim.diagnostic.setloclist()
      end,
      "diagnostic setloclist",
    },
  },
}

return M
