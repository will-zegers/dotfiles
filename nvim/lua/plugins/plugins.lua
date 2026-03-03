return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = 'v0.2.0',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    branch = 'main',
  },
  {
    "tpope/vim-surround",
    branch = 'master',
  },
  {
    "ziglang/zig.vim",
    branch = 'master',
  },
  {
    "jiangmiao/auto-pairs",
    branch = 'master',
  },
  {
    "neovim/nvim-lspconfig",
    branch = 'master',
  },
  {
    "axsaucedo/neovim-power-mode",
    config = function()
      require("power-mode").setup({
        auto_enable = false,
        particles = { preset = "stars" },
        shake = { mode = "scroll" },
        fire_wall = { enabled = true },
      })
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = 'powerline_dark' },
      })
    end
  }
}
