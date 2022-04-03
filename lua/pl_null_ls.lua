local nullls_ok, nullls = pcall(require, 'null-ls')
if not nullls_ok then
  return
end

nullls.setup({
  on_attach = function(client)
    -- trigger formatting on save
    if client.resolved_capabilities.document_formatting then
      vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
      ]])
    end
  end,
  sources = {
    nullls.builtins.code_actions.eslint,
    nullls.builtins.code_actions.gitsigns,
    nullls.builtins.completion.vsnip,
    nullls.builtins.diagnostics.eslint,
    nullls.builtins.formatting.prettier
  }
})
