--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- compile make project
vim.keymap.set('n', '<leader>mc', ':term cd out && make -j3 && cd ..<Enter>', { desc = 'compile make file in out dir' })
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

-- close buffer
vim.keymap.set('n', '<leader>k', ':bd <Enter>', { desc = 'kill buffer' })
-- open terminal
vim.keymap.set('n', '<leader>tr', vim.cmd.terminal, { desc = 'open terminal' })
-- exit terminal
--vim.keymap.set('t', '<leader>e', 'exit<Enter>', { desc = 'exit terminal' })
-- exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

--

--

--
vim.api.nvim_set_keymap('x', '<leader>a', [[:lua AlignVisualSelection()<CR>]], { desc = 'align on character', noremap = true, silent = true })

function AlignVisualSelection()
  local char = vim.fn.input 'Align on char: '
  if char == '' then
    return
  end

  local start_line = vim.fn.line "'<"
  local end_line = vim.fn.line "'>"
  local lines = vim.fn.getline(start_line, end_line)

  local maxlen = 0
  for _, line in ipairs(lines) do
    local before = line:match('^(.-)' .. vim.pesc(char))
    if before then
      maxlen = math.max(maxlen, vim.fn.strdisplaywidth(before))
    end
  end

  for i, line in ipairs(lines) do
    local before, after = line:match('^(.-)' .. vim.pesc(char) .. '(.*)')
    if before and after then
      lines[i] = string.format('%-' .. maxlen .. 's%s%s', before, char, after)
    end
  end

  vim.fn.setline(start_line, lines)
end
