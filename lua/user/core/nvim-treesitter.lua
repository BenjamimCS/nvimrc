local status_ok, treeSitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

treeSitter.setup{
  highlight = {
    enable = true
  },
  autotag = {
    enable = true,
  },
}
