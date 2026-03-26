return {
  -- Core: parser installation and management
  -- Highlighting/indent are handled automatically by Neovim once parsers are installed
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").install({
        "bash", "go", "gomod", "gosum", "gowork",
        "python", "rust", "toml",
        "typescript", "javascript", "tsx",
        "json", "yaml", "lua", "vim", "vimdoc",
        "html", "css", "markdown", "markdown_inline",
      })
    end,
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()

      -- Text objects: select/move by function, class, argument
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable    = true,
          lookahead = true,
          keymaps   = {
            ["af"] = { query = "@function.outer", desc = "outer function" },
            ["if"] = { query = "@function.inner", desc = "inner function" },
            ["ac"] = { query = "@class.outer",    desc = "outer class" },
            ["ic"] = { query = "@class.inner",    desc = "inner class" },
            ["aa"] = { query = "@parameter.outer", desc = "outer argument" },
            ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
          },
        },
        move = {
          enable    = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
        },
      })
    end,
  },

  -- Shows current function/class context at the top of the window
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      max_lines         = 3,
      min_window_height = 20,
    },
  },
}
