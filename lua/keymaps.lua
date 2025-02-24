--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Save file when exiting insert mode
vim.keymap.set('i', '<Esc>', '<Esc>:w<Enter>', { desc = 'save file after exiting insert' })
-- Exit files
vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = 'exit file' })
-- Map Ctrl+n to prompt for a new file and open it
vim.api.nvim_set_keymap('n', '<C-n>', ':e <C-R>=input("Enter filename: ")<CR><CR>', { noremap = true, silent = true })
-- Enable auto-cd into selected directory in netrw
vim.g.netrw_auto_cd = 1 -- Automatically cd into the directory when opening it
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
