return {
  -- Statusline (replaces vim-airline)
  {
    "nvim-lualine/lualine.nvim",
    event        = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme                = "catppuccin",
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        globalstatus         = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  -- Breadcrumbs in the winbar: shows file > class > function path
  -- Extremely useful for code reading in large files
  {
    "utilyre/barbecue.nvim",
    name         = "barbecue",
    version      = "*",
    event        = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = { theme = "catppuccin" },
  },

  -- File explorer (replaces vimfiler/unite)
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>",   desc = "File explorer" },
      { "<leader>E", "<cmd>NvimTreeFindFile<CR>", desc = "Reveal current file" },
    },
    opts = {
      view     = { width = 30 },
      renderer = {
        group_empty = true,
        icons       = { show = { git = true, file = true, folder = true } },
      },
      filters = { dotfiles = false },
      git     = { enable = true },
    },
  },

  -- Symbol outline: sidebar showing all functions/types/vars in the file
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "<leader>a", "<cmd>AerialToggle<CR>", desc = "Symbol outline" },
      { "[[", "<cmd>AerialPrev<CR>",          desc = "Prev symbol" },
      { "]]", "<cmd>AerialNext<CR>",          desc = "Next symbol" },
    },
    opts = {
      backends     = { "lsp", "treesitter", "markdown", "man" },
      layout       = { width = 35 },
      attach_mode  = "global",
      show_guides  = true,
    },
  },

  -- Diagnostics / references panel (replaces syntastic)
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd  = "Trouble",
    keys = {
      { "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>",             desc = "Diagnostics" },
      { "<leader>xb", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer diagnostics" },
      { "<leader>xs", "<cmd>Trouble symbols toggle<CR>",                 desc = "Symbols" },
      { "<leader>xr", "<cmd>Trouble lsp_references toggle<CR>",          desc = "LSP References" },
    },
    opts = {},
  },

  -- Indentation guides (replaces vim-indent-guides)
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    main  = "ibl",
    opts  = {
      indent = { char = "│" },
      scope  = { enabled = true },
    },
  },

  -- Hex/RGB colour highlighting (replaces lilydjwg/colorizer)
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},
  },

  -- Which-key: shows available keybindings on leader press
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts  = {
      preset = "modern",
      spec   = {
        { "<leader>a", desc = "Aerial (symbols)" },
        { "<leader>b", group = "Buffer" },
        { "<leader>c", group = "Code" },
        { "<leader>e", desc = "File explorer" },
        { "<leader>f", group = "Find / LSP symbols" },
        { "<leader>g", group = "Git" },
        { "<leader>h", group = "Git hunks" },
        { "<leader>l", group = "LSP" },
        { "<leader>r", group = "Refactor" },
        { "<leader>x", group = "Diagnostics" },
      },
    },
  },

  -- Better notification popups
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 3000,
      render  = "minimal",
      stages  = "fade",
    },
    config = function(_, opts)
      local notify = require("notify")
      notify.setup(opts)
      vim.notify = notify
    end,
  },
}
