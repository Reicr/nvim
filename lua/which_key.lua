local whichkey_ok, whichkey = pcall(require, 'which-key')
if not whichkey_ok then
  return
end

whichkey.setup {}
whichkey.register({
  f = {
    name = 'file',
    e = { '<cmd>NvimTreeToggle<cr>', 'File explorer' },
    f = { '<cmd>Telescope find_files<cr>', 'Find file' }
  },
  s = {
    name = 'LSP Saga',
    a = { '<cmd>Lspsaga code_action<cr>', 'Code actions' },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definition' },
    f = { ':Lspsaga lsp_finder<cr>', 'Finder'},
    i = { ':LspInfo<cr>', 'LSP Info' },
    j = { ':Lspsaga diagnostic_jump_next<cr>', 'Go to next diagnostic'},
    k = { ':Lspsaga diagnostic_jump_prev<cr>', 'Go to previous diagnostic'},
    o = { ':OrganizeImports<cr>', 'Organize imports'},
    p = { ':Lspsaga preview_definition<cr>', 'Preview definition'},
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', 'References' },
    s = { ':Lspsaga signature_help<cr>', 'Signature help'},
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', 'Type definition' },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', 'Go to declaration' },
    K = { ':Lspsaga hover_doc<cr>', 'Hover commands' },
    R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
  }
})
