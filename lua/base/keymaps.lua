-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- Shorten function name
local keymap = vim.keymap.set

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

-- Navigate buffers
keymap('n', '<A-k>', ':bn<CR>' , {noremap = true,silent = true})
keymap('n', '<A-j>', ':bp<CR>' ,  {noremap = true,silent = true})
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
keymap('v', '<', '<gv', v_)
keymap('v', '>', '>gv', v_)

-- Move text up and down
keymap('n', '<A-]>', '<Esc>:m .+1<CR>' )
keymap('n', '<A-[>', '<Esc>:m .-2<CR>' )

-- Move text up and down
keymap('v', '<A-]>', ':m .+1<CR>', v_)
keymap('v', '<A-[>', ':m .-2<CR>', v_)


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

keymap('n', '<leader>ff', '<Esc>:Telescope find_files<CR>' )
keymap('n', '<leader>fg', ':Telescope live_grep <cr>' )
keymap('n', '<leader>fb', ':Telescope buffers <cr>' )
keymap('n', '<leader>fh', ':Telescope help_tags <cr>' )

