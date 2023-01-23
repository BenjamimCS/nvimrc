local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok, masonLspConfig = pcall(require,"mason-lspconfig")
if not status_ok then
  return
end

local status_ok, lspConfig = pcall(require,"lspconfig")
if not status_ok then
  return
end

mason.setup()
masonLspConfig.setup()

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspConfig.sumneko_lua.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      --workspace = {
        -- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
      --},
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

lspConfig.bashls.setup{}

lspConfig.intelephense.setup{
  single_file_support = {true}
}

lspConfig.emmet_ls.setup{}

lspConfig.html.setup{
  capabilities = capabilities,
}

lspConfig.cssls.setup{
  capabilities = capabilities,
}

lspConfig.tsserver.setup{}
lspConfig.jsonls.setup{
  capabilities = capabilities
}
