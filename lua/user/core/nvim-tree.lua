local status_ok, nvimTree = pcall(require, "nvim-tree")
if not status_ok then
  print("nvim-tree is not installed")
  return
end

nvimTree.setup {
  renderer = {
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
  },
  view = {
    adaptive_size = true,
    width = 15,
    mappings = {
      list = {
        {
          key = {'l', 'h'},
          action = 'edit'
        },
        {
          key = {'<CR>'},
          action = 'cd'
        }
      }
    }
  }
}
