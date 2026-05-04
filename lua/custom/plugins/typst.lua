return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    build = function() require('typst-preview').update() end,
    config = function()
      require('typst-preview').setup {}
      vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', { desc = '[T]ypst [P]review' })
    end,
  },
}
