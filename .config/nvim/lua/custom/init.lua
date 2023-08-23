-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
-- highlight yanked text for 200ms using the "Visual" highlight group
vim.cmd [[
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank({higroup="Visual", timeout=200})
augroup END
autocmd FileType qf nmap <buffer> <cr> <cr>:lcl<cr><cr>:ccl<cr>
]]


--folding based on treesitter
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
vim.wo.foldlevel = 20

-- if vim.fn.has "wsl" == 1 then
--   vim.g.clipboard = {
--     copy = {
--       ["+"] = "win32yank.exe -i --crlf",
--       ["*"] = "win32yank.exe -i --crlf",
--     },
--     paste = {
--       ["+"] = "win32yank.exe -o --lf",
--       ["*"] = "win32yank.exe -o --lf",
--     },
--     cache_enabled = false,
--   }
-- end
