-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {
    'rachartier/tiny-code-action.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim' },
    },
    event = 'LspAttach',
    config = function()
      require('tiny-code-action').setup()
    end,
  },
  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy', -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require('tiny-inline-diagnostic').setup()
      vim.diagnostic.config { virtual_text = false } -- Only if needed in your configuration, if you already have native LSP diagnostics
    end,
  },
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
        defaults = {
          hidden = true,
          file_ignore_patterns = {
            '^.git/',
          },
        },
        pickers = {
          find_files = {
            hidden = true,
            respect_gitignore = true,
          },
          live_grep = {
            hidden = true,
            respect_gitignore = true,
          },
        },
        extensions = {
          file_browser = {
            hidden = true,
            respect_gitignore = false,
          },
        },
      }
      require('telescope').load_extension 'file_browser'
    end,
  },
  {
    {
      'swaits/zellij-nav.nvim',
      lazy = true,
      event = 'VeryLazy',
      keys = {
        { '<c-h>', '<cmd>ZellijNavigateLeftTab<cr>', { silent = true, desc = 'navigate left or tab' } },
        { '<c-j>', '<cmd>ZellijNavigateDown<cr>', { silent = true, desc = 'navigate down' } },
        { '<c-k>', '<cmd>ZellijNavigateUp<cr>', { silent = true, desc = 'navigate up' } },
        { '<c-l>', '<cmd>ZellijNavigateRightTab<cr>', { silent = true, desc = 'navigate right or tab' } },
      },
      opts = {},
    },
  },
}
