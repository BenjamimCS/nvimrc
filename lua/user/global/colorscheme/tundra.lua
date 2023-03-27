local status_ok, tundra = pcall(require, "nvim-tundra")
if not status_ok then
  print("tundra theme not installed")
  return
end

tundra.setup({
  -- setup...
})

vim.cmd.colorscheme("tundra")
