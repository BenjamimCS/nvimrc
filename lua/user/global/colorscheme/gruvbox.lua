local status_ok, gruvbox = pcall(require, "gruvbox")
if not status_ok then
  print("gruvbox: theme not installed")
end

gruvbox.setup{
  italic = false
}
