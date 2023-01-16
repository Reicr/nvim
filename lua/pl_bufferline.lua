local bufferline_ok, bufferline = pcall(require, 'bufferline')
if not bufferline_ok then
  return
end

bufferline.setup({
  options = {
    -- Display buffer numbers 
    numbers = function(opts)
      return string.format('%s', opts.id)
    end
  }
})
