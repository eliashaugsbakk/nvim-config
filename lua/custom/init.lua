-- [[ Custom Keymaps ]]

-- Buffer Management
vim.keymap.set('n', '<leader>bd', '<cmd>confirm bd<CR>', { desc = '[B]uffer [D]elete' })
vim.keymap.set('n', '<leader>bk', '<cmd>bd!<CR>', { desc = '[B]uffer [K]ill (Force)' })

-- Manual Directory Management
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = '[C]hange [D]irectory to current file' })

-- [[ C Shortcuts (Single File) ]]
local function c_term(cmd)
  vim.cmd 'silent write'
  vim.cmd('split | terminal cd "%:p:h" && ' .. cmd)
  vim.cmd 'startinsert'
end

local function c_quick(cmd)
  vim.cmd 'silent write'
  vim.cmd('!cd "%:p:h" && ' .. cmd)
end

-- Scoped to C and C++ files
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'c', 'cpp' },
  callback = function(event)
    vim.keymap.set('n', '<leader>cr', function()
      c_term 'gcc -Wall -Wextra "%:t" -o "%:t:r" -lm && ./"%:t:r"'
    end, { buffer = event.buf, desc = '[C]ompile & [R]un (Interactive)' })

    vim.keymap.set('n', '<leader>cx', function()
      c_quick 'gcc -Wall -Wextra "%:t" -o "%:t:r" -lm && ./"%:t:r"'
    end, { buffer = event.buf, desc = '[C]ompile & Run ([X]quick)' })

    vim.keymap.set('n', '<leader>cc', function()
      c_quick 'gcc -Wall -Wextra "%:t" -o "%:t:r" -lm'
    end, { buffer = event.buf, desc = '[C]ompile' })
  end,
})

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

-- Mappings (Rust files)
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust',
  callback = function(event)
    vim.keymap.set('n', '<leader>cr', function() cargo_term 'run' end, { buffer = event.buf, desc = '[C]argo [R]un (Interactive)' })
    vim.keymap.set('n', '<leader>cx', function() cargo_quick 'run' end, { buffer = event.buf, desc = '[C]argo Run ([X]quick)' })
    vim.keymap.set('n', '<leader>cc', function() cargo_quick 'check' end, { buffer = event.buf, desc = '[C]argo [C]heck' })
    vim.keymap.set('n', '<leader>ct', function() cargo_quick 'test' end, { buffer = event.buf, desc = '[C]argo [T]est' })
  end,
})

