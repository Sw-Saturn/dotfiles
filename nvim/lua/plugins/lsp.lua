return {
  -- Mason: GUI installer for LSP servers, formatters, linters
  {
    "williamboman/mason.nvim",
    cmd   = "Mason",
    build = ":MasonUpdate",
    opts  = {},
  },

  -- Auto-install LSP servers and tools declared below
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- LSP servers
        "gopls", "pyright", "typescript-language-server", "lua-language-server", "bash-language-server", "json-lsp", "yaml-language-server",
        -- Formatters
        "gofumpt", "goimports", "black", "isort", "prettier", "stylua",
      },
    },
  },

  -- Lua development: gives lua_ls full knowledge of the nvim API
  {
    "folke/lazydev.nvim",
    ft   = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  -- Core LSP configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Load lspconfig to register server definitions (cmd, root_dir, filetypes, etc.)
      -- vim.lsp.config/enable only override settings; the base definitions come from lspconfig
      require("lspconfig")

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keymaps applied whenever an LSP attaches to a buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspKeymaps", {}),
        callback = function(ev)
          local buf = ev.buf
          local function map(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = buf, desc = desc })
          end

          -- Navigation (code reading core)
          map("gd",         vim.lsp.buf.definition,                          "Go to definition")
          map("gD",         vim.lsp.buf.declaration,                         "Go to declaration")
          map("gr",         "<cmd>Telescope lsp_references<CR>",             "References")
          map("gi",         "<cmd>Telescope lsp_implementations<CR>",        "Implementations")
          map("gt",         "<cmd>Telescope lsp_type_definitions<CR>",       "Type definition")
          map("<leader>li", "<cmd>Telescope lsp_incoming_calls<CR>",         "Incoming calls")
          map("<leader>lo", "<cmd>Telescope lsp_outgoing_calls<CR>",         "Outgoing calls")
          map("<leader>fs", "<cmd>Telescope lsp_document_symbols<CR>",       "Document symbols")
          map("<leader>fw", "<cmd>Telescope lsp_workspace_symbols<CR>",      "Workspace symbols")

          -- Docs / hints
          map("K",          vim.lsp.buf.hover,                               "Hover docs")
          map("<leader>ls", vim.lsp.buf.signature_help,                      "Signature help")

          -- Editing
          map("<leader>rn", vim.lsp.buf.rename,                              "Rename symbol")
          map("<leader>ca", vim.lsp.buf.code_action,                         "Code action")
          map("<leader>lf", function() vim.lsp.buf.format({ async = true }) end, "Format buffer")
        end,
      })

      -- Global capabilities for all servers (nvim 0.11+ API)
      vim.lsp.config("*", { capabilities = capabilities })

      -- Per-server settings
      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            analyses        = { unusedparams = true, shadow = true },
            staticcheck     = true,
            gofumpt         = true,
            usePlaceholders = true,
            hints = {
              assignVariableTypes    = true,
              compositeLiteralFields = true,
              constantValues         = true,
              functionTypeParameters = true,
              parameterNames         = true,
              rangeVariableTypes     = true,
            },
          },
        },
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode       = "standard",
              autoSearchPaths        = true,
              useLibraryCodeForTypes = true,
              diagnosticMode         = "workspace",
            },
          },
        },
      })

      vim.lsp.config("ts_ls", {
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints             = "all",
              includeInlayFunctionParameterTypeHints     = true,
              includeInlayVariableTypeHints              = true,
              includeInlayPropertyDeclarationTypeHints   = true,
              includeInlayFunctionLikeReturnTypeHints    = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints         = "all",
              includeInlayFunctionParameterTypeHints = true,
            },
          },
        },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace   = { checkThirdParty = false },
            telemetry   = { enable = false },
          },
        },
      })

      vim.lsp.enable({ "gopls", "pyright", "ts_ls", "lua_ls", "bashls", "jsonls", "yamlls" })

      -- Enable inlay hints globally (nvim 0.10+)
      vim.lsp.inlay_hint.enable(true)
    end,
  },

  -- Rust: rustaceanvim handles rust-analyzer instead of lspconfig
  -- Provides richer Rust features: expand macro, run tests, cargo commands
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft      = "rust",
    opts = {
      server = {
        settings = {
          ["rust-analyzer"] = {
            checkOnSave   = { command = "clippy" },
            inlayHints    = { enable = true },
            procMacro     = { enable = true },
          },
        },
      },
    },
    config = function(_, opts)
      vim.g.rustaceanvim = opts
    end,
  },

  -- Formatting on save
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    cmd   = "ConformInfo",
    keys  = {
      { "<leader>cf", function() require("conform").format({ async = true, lsp_format = "fallback" }) end, desc = "Format (conform)" },
    },
    opts = {
      formatters_by_ft = {
        go         = { "gofumpt", "goimports" },
        python     = { "isort", "black" },
        typescript = { "prettier" },
        javascript = { "prettier" },
        json       = { "prettier" },
        yaml       = { "prettier" },
        lua        = { "stylua" },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
