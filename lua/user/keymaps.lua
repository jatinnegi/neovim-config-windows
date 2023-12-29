local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-j>", "5j", opts)
keymap("n", "<C-k>", "5k", opts)
keymap("n", "K", ":m .-2<CR>==", opts)
keymap("n", "J", ":m .+<CR>==", opts)

keymap("n", "<leader>e", ":Lex 25<cr>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Clear search pattern
keymap("n", "<leader>c", ":noh<Return>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Move text up and down
-- keymap("n", "<C-j>", ":m .+1<CR>==", opts)
-- keymap("n", "<C-k>", ":m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Delete entire word in insert mode
-- keymap("i", "<C-BS>", "<C-W>", opts)
-- keymap("i", "<BS>", "<C-W>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", "5j", opts)
keymap("x", "<C-k>", "5k", opts)

-- Copy to clipboard
keymap("v", "<C-c>", "\"*y", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- keymap("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>", opts)
keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>t", "<cmd>Telescope live_grep<cr>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)

-- Close Buffer
keymap("n", "<leader>q", ":BufferClose<CR>", opts)
keymap("n", "<leader>a", ":BufferClose!<CR>", opts)

-- Shift Buffers
keymap("n", ">", ":BufferMoveNext<CR>", opts)
keymap("n", "<", ":BufferMovePrevious<CR>", opts)

-- Navigate Buffers
keymap("n", "L", ":BufferNext<CR>", opts)
keymap("n", "H", ":BufferPrevious<CR>", opts)

-- Delete a word backwards
-- keymap("i", "<C-l>", "<C-w>", opts)

-- Open lazy git
keymap("n", "<leader>g", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts);

-- Quit NeoVim
keymap("n", "<leader>x", ":set guicursor=n:ver30<CR>:q<CR>", opts);

-- Trouble
vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
