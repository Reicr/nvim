local window_ok, window = pcall(require, 'nvim-window')
if not window_ok then
  return
end

window.setup({
  chars = {
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  },
  hint_hl = 'Bold',
  border = 'single'
})
