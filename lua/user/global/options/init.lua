vim.o.tabstop    = 2
vim.o.shiftwidth = 2
vim.o.expandtab  = true
vim.o.number     = true
vim.o.wrap       = false
vim.o.cmdheight  = 2

vim.cmd[[
augroup yaml_tabs
  autocmd!
  autocmd BufNewFile,BufRead,FileType,VimEnter,BufEnter
  \ *.yml,*.yaml setlocal tabstop=3 | setlocal shiftwidth=3
augroup END
]]
