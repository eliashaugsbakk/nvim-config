return {
  {
    'chomosuke/typst-preview.nvim',
    ft = 'typst',
    version = '1.*',
    build = function() require('typst-preview').update() end,
    config = function()
      require('typst-preview').setup {}

      vim.keymap.set('n', '<leader>tp', '<cmd>TypstPreview<cr>', {
        buffer = true,
        desc = '[T]ypst [P]review',
      })

      vim.keymap.set('n', '<leader>tc', function()
        vim.cmd.write()
        local filename = vim.api.nvim_buf_get_name(0)
        vim.system({ 'typst', 'compile', filename }, { text = true }, function(result)
          vim.schedule(function()
            if result.code == 0 then
              vim.notify('Typst compilation succeeded', vim.log.levels.INFO)
            else
              vim.notify(result.stderr ~= '' and result.stderr or 'Typst compilation failed', vim.log.levels.ERROR)
            end
          end)
        end)
      end, {
        buffer = true,
        desc = '[T]ypst [C]ompile',
      })
    end,
  },
}
