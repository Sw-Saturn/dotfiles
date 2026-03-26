local opt = vim.opt

-- Line numbers
opt.number         = true
opt.relativenumber = true

-- Indentation (4 spaces, same as current .vimrc)
opt.tabstop    = 4
opt.expandtab  = true
opt.shiftwidth = 4
opt.smartindent = true

-- Display
opt.title      = true
opt.cursorline = true
opt.scrolloff  = 10
opt.signcolumn = "yes"
opt.termguicolors = true
opt.background = "dark"
opt.laststatus = 3        -- single global statusline (nvim 0.7+)
opt.list       = true
opt.listchars  = {
  tab      = "»-",
  trail    = "·",
  eol      = "↲",
  extends  = "»",
  precedes = "«",
  nbsp     = "·",
}

-- Search
opt.hlsearch  = true
opt.incsearch = true
opt.ignorecase = true
opt.smartcase  = true

-- Files
opt.hidden   = true
opt.swapfile = false
opt.backup   = false
opt.undofile = true
opt.undodir  = vim.fn.stdpath("data") .. "/undodir"

-- Editor feel
opt.backspace  = "indent,eol,start"
opt.whichwrap  = "b,s,[,],<,>"
opt.virtualedit = "block"
opt.wildmenu   = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitbelow = true
opt.splitright = true

-- Completion
opt.completeopt = "menu,menuone,noselect"

-- Encoding
opt.encoding = "utf-8"
vim.scriptencoding = "utf-8"
