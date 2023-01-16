local package_info_ok, package_info = pcall(require, 'package-info')
if not package_info_ok then
  return
end

package_info.setup {
  autostart = false
}
