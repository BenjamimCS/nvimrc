local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- For Yaml files --
local yaml_tabs = augroup("yaml_tabs", {clear = true})

autocmd(
  {
    "BufNewFile", "BufRead",
    "FileType"  , "VimEnter",
    "BufEnter"
  },
  {
    group   = yaml_tabs,
    pattern = {"*.yml", "*.yaml"},
    command = "setlocal tabstop=3 | setlocal shiftwidth=3",
  }
)
