local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if not nvimtree_ok then
  return
end

nvimtree.setup {
  git = {
    ignore = false
  },
  update_focused_file = {
    enable = true
  },
  view = {
    width = 60
  }
}
