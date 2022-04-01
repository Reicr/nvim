local nullls_ok, nullls = pcall(require, 'null-ls')
if not nullls_ok then
  return
end

nullls.setup {
  sources = {
    nullls.builtins.code_actions.eslint,
    nullls.builtins.code_actions.gitsigns,
    nullls.builtins.completion.vsnip,
    nullls.builtins.diagnostics.eslint,
    nullls.builtins.formatting.prettier
  }
}
