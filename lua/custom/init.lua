-- [[ Custom Keymaps ]]
vim.keymap.set('n', '<leader>cr', ':!cargo run<CR>', { desc = '[C]argo [R]un' })
vim.keymap.set('n', '<leader>cc', ':!cargo check<CR>', { desc = '[C]argo [C]heck' })

-- You can add more custom logic here that isn't related to specific plugins
