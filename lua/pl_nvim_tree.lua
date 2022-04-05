local nvimtree_ok, nvimtree = pcall(require, 'nvim-tree')
if not nvimtree_ok then
  return
end

nvimtree.setup {
  hijack_directories = {
    enable = false
  },
  update_focused_file = {
    enable = true
  },
  view = {
    width = 60
  }
}
