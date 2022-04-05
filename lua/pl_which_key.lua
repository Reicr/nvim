local whichkey_ok, whichkey = pcall(require, 'which-key')
if not whichkey_ok then
  return
end

whichkey.setup {}
whichkey.register({
  ["<leader>"] = {
    f = {
      name = 'File',
      a = { '<cmd>Telescope lsp_code_actions<cr>', 'LSP code actions' },
      c = { '<cmd>Telescope conventional_commits<cr>', 'Conventional commits' },
      d = { '<cmd>Telescope lsp_definitions<cr>', 'LSP definitions' },
      e = { '<cmd>NvimTreeToggle<cr>', 'File explorer' },
      f = { '<cmd>Telescope find_files<cr>', 'Find file' },
      g = { '<cmd>Telescope grep_string<cr>', 'Grep cursor string' },
      i = { '<cmd>Telescope lsp_implementations<cr>', 'LSP implementations' },
      l = { '<cmd>Telescope live_grep<cr>', 'Live grep string' },
      r = { '<cmd>Telescope lsp_references<cr>', 'LSP references' },
      s = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Buffer fuzzy find' },
      t = { '<cmd>Telescope lsp_type_definitions<cr>', 'LSP type definitions' },
      v = { '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', 'Format file' },
    },
    g = {
      name = 'Git',
      b = { '<cmd>Telescope git_branches<cr>', 'Git branches' },
      c = { '<cmd>Telescope git_commits<cr>', 'Git commits' },
      j = { '<cmd>Gitsigns next_hunk<cr>', 'Next hunk' },
      k = { '<cmd>Gitsigns prev_hunk<cr>', 'Previous hunk' },
      s = { '<cmd>Telescope git_stash<cr>', 'Git stash' },
      t = { '<cmd>Telescope git_status<cr>', 'Git status' }
    },
    t = {
      name = 'Trouble',
      d = { '<cmd>Trouble lsp_definitions<cr>', 'LSP definitions' },
      i = { '<cmd>Trouble lsp_implementations<cr>', 'LSP implementations' },
      r = { '<cmd>Trouble lsp_references<cr>', 'LSP references' },
      t = { '<cmd>Trouble lsp_type_definitions<cr>', 'LSP type definitions' },
      D = { '<cmd>Trouble document_diagnostics<cr>', 'Document diagnostics' },
      T = { '<cmd>TroubleToggle<cr>', 'Toggle trouble' },
      W = { '<cmd>Trouble workspace_diagnostics<cr>', 'Workspace diagnostics' }
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
      I = { ':Lspsaga implement<cr>', 'Show implementation' },
      K = { ':Lspsaga hover_doc<cr>', 'Display hover doc' },
      R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    }
  }
})
