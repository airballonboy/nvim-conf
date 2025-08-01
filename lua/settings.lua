-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- ColorScheme settings
require('vscode').setup {
  -- Enable transparent background (optional)
  transparent = false,

  -- Override specific colors
  color_overrides = {},
}
vim.cmd 'colorscheme vscode'

-- Global tab settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

vim.diagnostic.config { virtual_text = true }
-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Show inline text
vim.g.diagnostics_active = true

-- auto commands
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
-- :T for terminal time
-- for gpt o4-mini so if any bad blame AI
vim.api.nvim_create_user_command('T', function(opts)
  local args = opts.fargs
  local cmd = 'time ' .. table.concat(args, ' ')
  vim.cmd('term ' .. cmd)
end, {
  nargs = '*',
  complete = function(ArgLead, CmdLine, CursorPos)
    return vim.fn.getcompletion(ArgLead, 'file')
  end,
})
