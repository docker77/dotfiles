-- custom.plugins.lspconfig

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

local servers = {
  "html",
  "tsserver",
  "tailwindcss",
  "cssls",
  "bashls",
  "emmet_ls",
  "jsonls",
  "cssmodules_ls",
  "stylelint_lsp",
  "sumneko_lua",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end
