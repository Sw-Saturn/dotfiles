return {
  {
    "nvim-telescope/telescope.nvim",
    cmd          = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = {
      -- Files
      { "<leader>ff", "<cmd>Telescope find_files<CR>",  desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<CR>",   desc = "Live grep" },
      { "<leader>fr", "<cmd>Telescope oldfiles<CR>",    desc = "Recent files" },
      { "<leader>fb", "<cmd>Telescope buffers<CR>",     desc = "Buffers" },
      -- Help / commands
      { "<leader>fh", "<cmd>Telescope help_tags<CR>",   desc = "Help tags" },
      { "<leader>fk", "<cmd>Telescope keymaps<CR>",     desc = "Keymaps" },
      -- LSP (also mapped from lsp.lua on attach)
      { "<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",  desc = "Document symbols" },
      { "<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
      { "<leader>fd", "<cmd>Telescope diagnostics<CR>",           desc = "Diagnostics" },
      -- Git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>",  desc = "Git commits" },
      { "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Git branches" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>",   desc = "Git status" },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-q>"] = "send_to_qflist",
          },
        },
        file_ignore_patterns = { "node_modules", ".git/", "target/", "__pycache__" },
        layout_strategy = "horizontal",
        layout_config   = { preview_width = 0.55 },
      },
      extensions = { fzf = {} },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("fzf")
    end,
  },
}
