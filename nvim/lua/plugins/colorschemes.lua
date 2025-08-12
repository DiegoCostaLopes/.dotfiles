return {
  { 'folke/tokyonight.nvim', priority = 1000 },
  {
    'comfysage/evergarden',
    priority = 1000,
    opts = {
      transparent_background = true,
      variant = 'medium', -- 'hard'|'medium'|'soft'
      overrides = {}, -- add custom overrides
    },
  },
  { 'ellisonleao/gruvbox.nvim', priority = 1000, config = true, opts = {} },
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  { 'rebelot/kanagawa.nvim', priority = 1000 },
  { 'EdenEast/nightfox.nvim' },
}
