local nmap = function(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
end

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
nmap("n", "<C-h>", "<C-w>h", "Move to the window on the left.")
-- nmap("n", "<C-j>", "<C-w>j", "Move to the window on the right.")
-- nmap("n", "<C-k>", "<C-w>k", "Move to the window on the bottom.")
nmap("n", "<C-l>", "<C-w>l", "Move to the window on the top.")

-- Resize with arrows
nmap("n", "<C-Up>", ":resize -2<CR>", "Resize current window's height by 2 lines up.")
nmap("n", "<C-Down>", ":resize +2<CR>", "Resize current window's height by 2 lines down.")
nmap("n", "<C-Left>", ":vertical resize +2<CR>", "Resize current window's width by 2 lines left.")
nmap("n", "<C-Right>", ":vertical resize -2<CR>", "Resize current window's width by 2 lines right.")

-- Navigate buffers
nmap("n", "<S-l>", "<CMD>bnext<CR>", "Switch to the next buffer.")
nmap("n", "<S-h>", "<CMD>bprevious<CR>", "Switch to the previous buffer.")
nmap("n", "<leader>x", "<CMD>bdelete<CR>", "Close current buffer")

-- Move text up and down
nmap("n", "<A-j>", ":m .+1<CR>==", "Move line down.")
nmap("n", "<A-k>", ":m .-2<CR>==", "Move line up.")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- LSPs
nmap('n', '<space>f', vim.diagnostic.open_float, "Open diagnostic.")
-- nmap('n', '[d', vim.diagnostic.goto_prev, "Go to previous diagnostic")
-- nmap('n', ']d', vim.diagnostic.goto_next, "Go to next diagnostic")
-- nmap('n', '<space>q', vim.diagnostic.setloclist)
nmap('i', '<C-m>', vim.lsp.buf.signature_help, "Open signature_help")

-- Misc
nmap('n', '<Esc>', ':noh <CR>', 'Clear highlights')
nmap('n', '<C-j>', '5j', 'Move 5 lines down')
nmap('n', '<C-k>', '5k', 'Move 5 lines up')

nmap('n', '<leader>z', ':q<CR>', 'Close current window')
nmap('n', '<leader>v', ':vsplit<CR>', 'Split window vertically')
nmap('n', '<leader>h', ':split<CR>', 'Split window horizontally')

-- Insert --
-- Press jk fast to exit insert mode 
nmap("i", "jk", "<ESC>", "Switch to insert mode.")
nmap("i", "kj", "<ESC>", "Switch to insert mode.")

-- Move around in insert mode
nmap("i", "<C-k>", "<Up>", "Move up")
nmap("i", "<C-l>", "<Right>", "Move right")
nmap("i", "<C-j>", "<Down>", "Move down")
nmap("i", "<C-h>", "<Left>", "Move left")

-- Visual --
-- Stay in indent mode
nmap("v", "<", "<gv^", "Shift the selected text left, then reselect the visual block.")
nmap("v", ">", ">gv^", "Shift the selected text right, then reselect the visual block.")

-- Move text up and down
nmap("v", "<A-j>", ":m '>+1<CR>gv=gv", "Move line down.")
nmap("v", "<A-k>", ":m '<-2<CR>gv=gv", "Move line up.")
nmap("v", "p", '"_dP', "Paste the yanked text, replacing the selected text.")

-- Visual Block --
-- Move text up and down
nmap("x", "J", ":m '>+1<CR>gv=gv", "Move line down.")
nmap("x", "K", ":m '<-2<CR>gv=gv", "Move line up.")
nmap("x", "<A-j>", ":m '>+1<CR>gv=gv", "Move line down.")
nmap("x", "<A-k>", ":m '<-2<CR>gv=gv", "Move line up.")

-- Delete & Yank extras
nmap({"n", "v"}, "d", "\"_d", "Delete without yanking")
nmap("v", "p", "\"_dP", "Replace-paste without yanking")

-- Save File
nmap({"n", "s"}, "<C-s>", ":w<CR>", "Save current file")

-- Select All
nmap("n", "<C-A>", "ggVG", "Select all")
