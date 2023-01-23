local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  print("lualine is not installed")
  return
end

lualine.setup{
  options = {
    theme = 'tundra',
    component_separators = '',
    section_separators = '',
  }
}
