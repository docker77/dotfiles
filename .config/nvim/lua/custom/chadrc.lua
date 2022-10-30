local M = {}

vim.opt.relativenumber = true
-- vim.opt.did_load_filetypes = 1

M.plugins = require "custom.plugins"

-- local my_highlights = require "custom.highlights"

M.ui = {
  theme = "palenight",
  theme_toggle = { "onenord", "palenight" },
  italic_comments = true,
  hl_override = require("custom.highlights").overriden_hlgroups,
}

M.mappings = require "custom.mappings"

return M
