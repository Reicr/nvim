return {
  -- plugin for command hints
  {
    'folke/which-key.nvim',
    config = function ()
      local whichkey = require('which-key')

      whichkey.setup()
      whichkey.register({
        ["<leader>"] = {
          b = {
            name = 'Bufferline',
            a = { ':%bdelete!<cr>', 'Delete all buffers' },
            d = { ':bdelete!<cr>', 'Delete buffer' },
            l = { ':bl<cr>', 'Open last buffer' },
          },
          f = {
            name = 'Telescope',
            b = { '<cmd>Telescope buffers<cr>', 'List Buffers' },
            ['cc'] = { '<cmd>Telescope conventional_commits<cr>', 'Conventional commits' },
            d = {
              name = 'Diagnostics',
              ['d'] = { '<cmd>Telescope diagnostics bufnr=0<cr>', 'LSP document diagnostics' },
              ['w'] = { '<cmd>Telescope diagnostics<cr>', 'LSP workspace diagnostics' },
            },
            f = { '<cmd>Telescope find_files<cr>', 'Find file' },
            g = {
              name = 'Grep',
              b = { '<cmd>Telescope current_buffer_fuzzy_find<cr>', 'Buffer fuzzy find' },
              l = { '<cmd>Telescope live_grep<cr>', 'Live grep string' },
              s = { '<cmd>Telescope grep_string<cr>', 'Grep cursor string' },
            },
            l = {
              name = 'LSP',
              d = { '<cmd>Telescope lsp_definitions<cr>', 'LSP definitions' },
              ['ds'] = { '<cmd>Telescope lsp_document_symbols<cr>', 'LSP document symbols' },
              i = { '<cmd>Telescope lsp_implementations<cr>', 'LSP implementations' },
              r = { '<cmd>Telescope lsp_references<cr>', 'LSP references' },
              t = { '<cmd>Telescope lsp_type_definitions<cr>', 'LSP type definitions' },
              ['ws'] = { '<cmd>Telescope lsp_workspace_symbols<cr>', 'LSP workspace symbols' },
            },
            m = { '<cmd>Telescope marks<cr>', 'Marks' },
            r = { '<cmd>Telescope resume<cr>', 'Resume search' },
          },
          e = {
            name = 'Explorer',
            t = { '<cmd>Explore<cr>', 'File explorer' },
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
          l = {
            name = 'LSP',
            a = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'Code Actions' },
            d = { '<cmd>lua vim.lsp.buf.definition()<cr>', 'Go to definintion' },
            f = { '<cmd>lua vim.lsp.buf.format()<cr>', 'Format file' },
            h = { '<cmd>lua vim.lsp.buf.hover()<cr>', 'Hover' },
            i = { '<cmd>lua vim.lsp.buf.implementation()<cr>', 'Go to implementation' },
            I = { '<cmd>LspInfo<cr>', 'LSP Info' },
            o = { ':OrganizeImports<cr>', 'Organize imports'},
            r = { '<cmd>lua vim.lsp.buf.rename()<cr>', 'Rename' },
            R = { '<cmd>LspRestart<cr>', 'Restart' },
            S = { '<cmd>LspStart<cr>', 'Start' },
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
    end
  }
}
