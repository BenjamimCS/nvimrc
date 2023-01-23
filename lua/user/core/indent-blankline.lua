local status_ok, indentBlankline = pcall(require, "indent_blankline")
if not status_ok then
  print("indent-blankline is not installed")
  return
end

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

indentBlankline.setup {
  show_end_of_line = true,
  space_char_blankline = ' ',
}
