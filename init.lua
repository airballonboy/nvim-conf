require 'keymaps' -- Loads lua/keymaps.lua
require 'plugins' -- Loads lua/plugins.lua
require 'settings' -- Loads lua/settings.lua

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
--vim.schedule(function()
--  vim.opt.clipboard = 'unnamedplus'
--end)
--

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

--vim.filetype.add {
--  extension = {
--    mlang = 'mlang',
--  },
--}
--
--require('nvim-treesitter.configs').setup {
--  playground = {
--    enable = true,
--    updatetime = 25,
--  },
--}
--local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
--parser_config.mlang = {
--  install_info = {
--    url = '/home/ahmed/.local/share/tree-sitter-grammars/tree-sitter-mlang', -- full path to your repo
--    files = { 'src/parser.c' },
--    branch = 'main', -- or "master", depends on your repo
--  },
--  filetype = 'mlang',
--}
--require('nvim-treesitter.configs').setup {
--  ensure_installed = { 'mlang', 'c', 'lua', 'python' },
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--}

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
require('nvim-treesitter.install').compilers = { 'cl', 'gcc' }
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
