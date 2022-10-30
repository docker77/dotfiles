local M = {}

-- print("mappings")
-- add this table only when you want to disable default keys
M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<TAB>"] = "",
  },
}

M.mine = {
  n = {
    ["<leader>q"] = { ":q <CR>", "quit" },
    ["<leader>cc"] = { ":Telescope <CR>", "" },
    ["<leader>bl"] = { ":Git blame_line <CR>", "" },
    ["<leader>ba"] = { ":bufdo bd <CR>", "" },
    -- ["<leader>q"] = { ":q <CR>", "" },
    ["<leader>ft"] = { ":NvimTreeToggle <CR>", "" },
    ["<leader>fo"] = { ":Telescope frecency <CR>", "" },
    ["<leader>fr"] = { ":Telescope resume <CR>", "" },
    ["<leader>th"] = { ":nohl <CR>", "" },
    ["<leader>tt"] = { "<cmd> Telescope themes <CR>", "   nvchad themes" },
    ["<leader>tw"] = { ":set wrap! <CR>", "" },
    ["U"] = { ":redo <CR>", "" },
    ["gd"] = { ":Telescope lsp_definitions <CR>", "" },
    ["gr"] = { ":Telescope lsp_references <CR>", "" },
    -- ["gr"] = { ":lua vim.lsp.buf.references { noremap=true, silent=true, buffer=bufnr } <CR>", "" },
    ["<leader>fm"] = { ":lua vim.lsp.buf.format { async = true }<CR>", "" },
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
