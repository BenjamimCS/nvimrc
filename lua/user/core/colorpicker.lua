local status_ok, colorpicker = pcall(require, "color-picker")
if not status_ok then
  print("colorpicker is not installed")
  return
end

colorpicker.setup{

}
