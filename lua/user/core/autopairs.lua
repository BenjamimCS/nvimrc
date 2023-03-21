local status_ok, Autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
  print("Autopairs is not installed")
  return
end

Autopairs.setup {
  -- setup...
}
