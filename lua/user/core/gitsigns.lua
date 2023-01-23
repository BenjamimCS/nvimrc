local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  print("gitsigns is not installed")
  return
end

gitsigns.setup{
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
}
