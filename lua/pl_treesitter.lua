local treesittercfg_ok, treesittercfg = pcall(require, 'nvim-treesitter.configs')
if not treesittercfg_ok then
  return
end

treesittercfg.setup {
  ensure_installed = {
    'css',
    'graphql',
    'html',
    'javascript',
    'json',
    'lua',
    'markdown',
    'scss',
    'svelte',
    'tsx',
    'typescript',
    'vim',
    'vue',
    'yaml'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  }
}
