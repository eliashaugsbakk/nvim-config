return {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    -- This runs 'npm install' inside the plugin folder automatically after download
    build = 'cd app && npm install',
    config = function()
      -- This ensures the keymap is available in markdown files
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'markdown',
        callback = function()
          vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', { buffer = true, desc = '[M]arkdown [P]review' })
        end,
      })
    end,
  },
}
