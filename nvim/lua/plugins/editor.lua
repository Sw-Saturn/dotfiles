return {
  -- Auto pairs (replaces manual inoremap { {}<Left> etc.)
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts  = {},
  },

  -- Git diff signs in the gutter + hunk operations (replaces vim-gitgutter)
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {
      signs = {
        add          = { text = "▎" },
        change       = { text = "▎" },
        delete       = { text = "" },
        topdelete    = { text = "" },
        changedelete = { text = "▎" },
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local function map(lhs, rhs, desc)
          vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("]h", gs.next_hunk,                              "Next hunk")
        map("[h", gs.prev_hunk,                              "Prev hunk")
        map("<leader>hp", gs.preview_hunk,                   "Preview hunk")
        map("<leader>hs", gs.stage_hunk,                     "Stage hunk")
        map("<leader>hr", gs.reset_hunk,                     "Reset hunk")
        map("<leader>hb", function() gs.blame_line({ full = true }) end, "Blame line")
        map("<leader>hd", gs.diffthis,                       "Diff this")
      end,
    },
  },

  -- Git (replaces fugitive-style usage)
  {
    "tpope/vim-fugitive",
    cmd  = { "Git", "Gblame", "Gdiff", "Glog" },
    keys = {
      { "<leader>gg", "<cmd>Git<CR>", desc = "Git status" },
    },
  },

  -- Comments: gc{motion} to toggle
  {
    "numToStr/Comment.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},
  },

  -- Surround: ys{motion}{char}, cs, ds
  {
    "kylechui/nvim-surround",
    event = { "BufReadPost", "BufNewFile" },
    opts  = {},
  },

  -- Flash: faster cursor movement via s / S
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts  = {},
    keys  = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,            desc = "Flash jump" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,      desc = "Flash treesitter" },
    },
  },

  -- File explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch       = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "File explorer" },
    },
    opts = {
      window = { width = 30 },
      filesystem = {
        filtered_items = {
          hide_dotfiles   = false,
          hide_gitignored = true,
        },
        follow_current_file = { enabled = false },
      },
    },
  },

  -- Emmet (HTML/CSS shortcuts)
  {
    "mattn/emmet-vim",
    ft = { "html", "css", "javascript", "javascriptreact", "typescriptreact" },
  },
}
