local key = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "

--- Auto Command Mode ---
key("n", "<leader>;", ":")

-- Nvim Tree
key("n", "<leader>o", ":NvimTreeToggle<CR>", opts)
key("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", opts)

--- Gitsigns --- 
key("n", "<leader>d", ":Gitsigns preview_hunk<CR>", opts)

--- Barbar ---
-- Move to previous/next
key('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
key('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
key('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
key('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Close buffer
key('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)

-- ^ + q : Save
key("n", "<leader>s", ":w<CR>")
key("i", "<C>s", "<ESC>:w<CR>")
-- ^ + q : Quite
key("n", "<leader>q", ":q<CR>")
key("n", "<C>q", ":q<CR>")

-- Resize Windows
key("n", "<C-Down>" , ":resize +1<CR>")
key("n", "<C-Up>"   , ":resize -1<CR>")
key("n", "<C-Left>" , ":resize +1<CR>")
key("n", "<C-Right>", ":vertical resize -1<CR>")

-- Navigate between buffers
key("n", "<C-K>" , "<C-w><Up>")
key("n", "<C-J>" , "<C-w><Down>")
key("n", "<C-h>" , "<C-w><Left>")
key("n", "<C-l>" , "<C-w><Right>")

-- Colorpicker Activator
key("n", "<C-c>", "<cmd>PickColor<cr>", opts)
key("i", "<C-c>", "<cmd>PickColorInsert<cr>", opts)


--- Coc-Explorer
--key("n", "<C-e>", ":CocCommand explorer --toogle")
-- vim.cmd([[
-- let g:coc_explorer_global_presets = {
-- \   '.vim': {
-- \     'root-uri': '~/.vim',
-- \   },
-- \   'cocConfig': {
-- \      'root-uri': '~/.config/coc',
-- \   },
-- \   'tab': {
-- \     'position': 'tab',
-- \     'quit-on-open': v:true,
-- \   },
-- \   'tab:$': {
-- \     'position': 'tab:$',
-- \     'quit-on-open': v:true,
-- \   },
-- \   'floating': {
-- \     'position': 'floating',
-- \     'open-action-strategy': 'sourceWindow',
-- \   },
-- \   'floatingTop': {
-- \     'position': 'floating',
-- \     'floating-position': 'center-top',
-- \     'open-action-strategy': 'sourceWindow',
-- \   },
-- \   'floatingLeftside': {
-- \     'position': 'floating',
-- \     'floating-position': 'left-center',
-- \     'floating-width': 50,
-- \     'open-action-strategy': 'sourceWindow',
-- \   },
-- \   'floatingRightside': {
-- \     'position': 'floating',
-- \     'floating-position': 'right-center',
-- \     'floating-width': 50,
-- \     'open-action-strategy': 'sourceWindow',
-- \   },
-- \   'simplify': {
-- \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
-- \   },
-- \   'buffer': {
-- \     'sources': [{'name': 'buffer', 'expand': v:true}]
-- \   },
-- \ }
--
-- " Use preset argument to open it
-- "noremap <space>e <Cmd>CocCommand explorer --toggle<CR>
-- "noremap <space>vi <Cmd>CocCommand explorer --preset vi<CR>
-- "noremap <space>ef <Cmd>CocCommand explorer --preset floating<CR>
-- "noremap <space>ec <Cmd>CocCommand explorer --preset cocConfig<CR>
-- "noremap <space>eb <Cmd>CocCommand explorer --preset buffer<CR>
--
-- " List all presets
-- nmap <space>el <Cmd>CocList explPresets<CR>
-- ]])
