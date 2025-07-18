-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Shorten function name
local keymap = vim.keymap.set
local is_windows = package.config:sub(1,1) == '\\'
--Remap space as leader key
vim.g.mapleader = ';'

-- edit mode
keymap('i', 'jk', '<ESC>')

keymap('n', '<leader>w', ':w<cr>' )
keymap('n', '<leader>W', ':wa<cr>' )
keymap('n', '<leader>q', ':q<cr>' )
keymap('n', '<leader>Q', ':qa<cr>' )
keymap('i', '<leader>w', '<ESC>:w<cr>' )
keymap('i', '<leader>W', '<ESC>:wa<cr>' )
keymap('i', '<leader>q', '<ESC>:q<cr>' )
keymap('i', '<leader>Q', '<ESC>:qa<cr>' )
keymap('i', '<leader>WQ', '<ESC>:wqa<cr>' )

-- Navigate buffers
keymap('n', '<A-h>', ':bn<CR>' , {noremap = true,silent = true})
keymap('n', '<A-l>', ':bp<CR>' ,  {noremap = true,silent = true})
keymap('n', '<A-s>', ':BufferLinePick <CR>' ,  {noremap = true,silent = true})
keymap('n', '<A-d>', ':Bdelete <CR>' ,  {noremap = true,silent = true})


-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h' )
keymap('n', '<C-j>', '<C-w>j' )
keymap('n', '<C-l>', '<C-w>l' )
keymap('n', '<C-k>', '<C-w>k' )

-- Resize with arrows
keymap('n', '<C-Up>', ':resize -2<CR>' )
keymap('n', '<C-Down>', ':resize +2<CR>' )
keymap('n', '<C-Left>', ':vertical resize -2<CR>' )
keymap('n', '<C-Right>', ':vertical resize +2<CR>' )


-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

-- Move text up and down
keymap('n', '<A-]>', '<Esc>:m .+1<CR>' )
keymap('n', '<A-[>', '<Esc>:m .-2<CR>' )

-- Move text up and down
keymap('v', '<A-]>', ':m .+1<CR>')
keymap('v', '<A-[>', ':m .-2<CR>')


-- Visual Block --
-- Move text up and down
-- keymap('x', 'J', ':move '>+1<CR>gv-gv' )
-- keymap('x', 'K', ':move '<-2<CR>gv-gv' )
keymap('x', '<A-]>', ":move '>+1<CR>gv-gv" )
keymap('x', '<A-[>', ":move '<-2<CR>gv-gv" )

-- Terminal --
-- Better terminal navigation
-- keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_)
-- keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_)
-- keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_)
-- keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_)



-- Search telescope --
keymap('n', '<leader>fs', '<Esc>:Telescope find_files<CR>' )
keymap('n', '<leader>fg', ':Telescope live_grep <cr>' )
keymap('n', '<leader>fb', ':Telescope git_branchs<cr>' )
keymap('n', '<leader>fc', ':Telescope git_commits<cr>' )
keymap('n', '<leader>ft', ':Telescope tags<cr>' )
keymap('n', '<leader>fr', ':Telescope oldfiles <cr>' )
keymap('n', '<leader>gg', ':Telescope grep_string <cr>' )

-- use clang-format format code --
keymap('n', '<C-A-f>', '<Esc>:!clang-format -i % <cr>' )

-- 查找当前光标下的单词；
--keymap('n', '<C-A-c>', '<Esc>:cs find c <C-R>=expand("<cword>")<cr><cr>' )


-- run config --
keymap('n', '<leader>rr', is_windows and '<Esc>:!run.bat <cr>' or '<Esc>:!./run.sh <cr>' )
keymap('n', '<leader>rc', '<Esc>:terminal <cr>' )
keymap('n', '<leader>rd', is_windows and '<Esc>:!run.bat -d<cr>' or '<Esc>:!./run.sh -d<cr>' )


-- nvim-tree-
keymap('n', '<leader>e', '<Esc>:NvimTreeToggle <cr>' )

-- easymotion -- 
keymap('n', 'ss', '<Plug>(easymotion-s2)' )
-- terminal -- 
keymap('n', '<leader>t', ':ToggleTerm <cr>' )


-- dap config  --
local dap = require('dap')
keymap('n', '<leader>dt',  dap.toggle_breakpoint)
keymap('n', '<leader>dc',  dap.continue)
keymap('n', '<leader>dr',  dap.repl.open)
keymap('n', '<leader>dk',  dap.terminate)

keymap('n', '<leader>dso',  dap.step_over)
keymap('n', '<leader>dsi',  dap.step_into)
keymap('n', '<leader>dsu',  dap.step_out)
keymap('n', '<leader>dl',  dap.run_last)

local dapui = require('dapui')
keymap('n', '<leader>duu',  dapui.open)
keymap('n', '<leader>duc',  dapui.close)
