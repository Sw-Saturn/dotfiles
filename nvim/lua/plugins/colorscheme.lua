-- Catppuccin Mocha: dark background with lavender/purple accents,
-- the best-integrated theme for the plugin stack used here.
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        cmp            = true,
        gitsigns       = true,
        nvimtree       = true,
        treesitter     = true,
        treesitter_context = true,
        telescope      = { enabled = true },
        which_key      = true,
        trouble        = true,
        aerial         = true,
        barbecue       = { dim_dirname = true },
        mason          = true,
        indent_blankline = { enabled = true },
        lsp_trouble    = true,
        notify         = true,
      },
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
