local status_ok, barbar = pcall(require, "bufferline")
if not status_ok then
  print("barbar is not installed")
  return
end

