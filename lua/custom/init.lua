-- [[ Custom Keymaps ]]

-- Buffer Management
vim.keymap.set('n', '<leader>bd', '<cmd>confirm bd<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bk', '<cmd>bd!<CR>', { desc = '[B]uffer [K]ill (Force)' })

-- Manual Directory Management
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = '[C]hange [D]irectory to current file' })

-- [[ Cargo Shortcuts ]]

-- 1. Quick Version (Non-interactive, uses :!)
local function cargo_quick(cmd)
  vim.cmd('!cargo ' .. cmd)
end

-- 2. Interactive Version (Uses :terminal)
local function cargo_term(cmd)
  vim.cmd('split | terminal cargo ' .. cmd)
  vim.cmd 'startinsert'
end

-- Mappings
vim.keymap.set('n', '<leader>cr', function() cargo_term 'run' end, { desc = '[C]argo [R]un (Interactive)' })
vim.keymap.set('n', '<leader>cx', function() cargo_quick 'run' end, { desc = '[C]argo Run ([X]quick)' })
vim.keymap.set('n', '<leader>cc', function() cargo_quick 'check' end, { desc = '[C]argo [C]heck' })
vim.keymap.set('n', '<leader>ct', function() cargo_quick 'test' end, { desc = '[C]argo [T]est' })
