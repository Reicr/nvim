local lualine_ok, lualine = pcall(require, 'lualine')
if not lualine_ok then
  return
end

local package_info = require('package-info')

lualine.setup {
  sections = {
    lualine_c = { 'filename', package_info.get_status }
  }
}
