local whichkey_ok, whichkey = pcall(require, 'which-key')
if not whichkey_ok then
  return
end

whichkey.setup {}
whichkey.register({
  ["<leader>"] = {
    b = {
      name = 'Bufferline',
      d = { ':bdelete!<cr>', 'Delete buffer' },
      j = { ':BufferLineCycleNext<cr>', 'Next buffer' },
      k = { ':BufferLineCyclePrev<cr>', 'Previous buffer' },
      l = { ':bl<cr>', 'Open last buffer' },
      p = { ':BufferLinePick<cr>', 'Pick buffer'}
    },
    f = {
      name = 'Telescope',
      c = { '<cmd>Telescope conventional_commits<cr>', 'Conventional commits' },
      d = { '<cmd>Telescope lsp_definitions<cr>', 'LSP definitions' },
      ['dd'] = { '<cmd>Telescope diagnostics bufnr=0<cr>', 'LSP document diagnostics' },
      ['ds'] = { '<cmd>Telescope lsp_document_symbols<cr>', 'LSP document symbols' },
      e = { '<cmd>NvimTreeToggle<cr>', 'File explorer' },
      f = { '<cmd>Telescope find_files<cr>', 'Find file' },
      g = { '<cmd>Telescope grep_string<cr>', 'Grep cursor string' },
      i = { '<cmd>Telescope lsp_implementations<cr>', 'LSP implementations' },
      l = { '<cmd>Telescope live_grep<cr>', 'Live grep string' },
      o = { ':OrganizeImports<cr>', 'Organize imports'},
      r = { '<cmd>Telescope lsp_references<cr>', 'LSP references' },
      s = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Buffer fuzzy find' },
      t = { '<cmd>Telescope lsp_type_definitions<cr>', 'LSP type definitions' },
      v = { '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', 'Format file' },
      ['wd'] = { '<cmd>Telescope diagnostics<cr>', 'LSP workspace diagnostics' },
      ['ws'] = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'LSP workspace symbols' },
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
    h = {
      name = 'Hop',
      a = { ':HopAnywhere<cr>', 'Hop to anywhere' },
      b = { ':HopChar2<cr>', 'Hop to bigram' },
      c = { ':HopChar1<cr>', 'Hop to character' },
      l = { ':HopLine<cr>', 'Hop to line' },
      ['ls'] = { ':HopLineStart<cr>', 'Hop to line start' },
      p = { ':HopPattern<cr>', 'Hop to pattern' },
      w = { ':HopWord<cr>', 'Hop to word' },
    },
    l = {
      name = 'LSP',
      a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Actions' },
      d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definintion' },
      f = { '<cmd>lua vim.lsp.buf.formatting_sync()<cr>', 'Format file' },
      h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
      i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation' },
      I = { '<cmd>LspInfo<cr>', 'LSP Info' },
      R = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
    },
    p = {
      name = 'Package Info',
      c = { '<cmd>PackageInfoChangeVersion<cr>', 'Change package version' },
      d = { '<cmd>PackageInfoDelete<cr>', 'Delete package' },
      h = { '<cmd>PackageInfoHide<cr>', 'Hide package version info' },
      i = { '<cmd>PackageInfoInstall<cr>', 'Install new package' },
      s = { '<cmd>PackageInfoShow<cr>', 'Show package version info' },
      u = { '<cmd>PackageInfoUpdate<cr>', 'Update package' },
    },
    r = {
      name = 'Resize window',
      ['hd'] = { '<cmd>resize -10<cr>', 'Decrease height' },
      ['hi'] = { '<cmd>resize +10<cr>', 'Increase height' },
      ['vd'] = { '<cmd>vertical resize -10<cr>', 'Decrease width' },
      ['vi'] = { '<cmd>vertical resize +10<cr>', 'Increase width' },
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
    w = { ':lua require("nvim-window").pick()<cr>' , 'Pick window' }
  }
})
