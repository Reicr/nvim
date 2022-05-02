local bufferline_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_ok then
  return
end

bufferline.setup()
