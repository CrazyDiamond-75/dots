-- Load everything lazy related
require("config.lazy")

-- Set path
vim.opt.path:append("**")

-- Basic settings
vim.opt.modelines = 0
vim.opt.autoread = true
vim.opt.encoding = "utf-8"
vim.opt.visualbell = true
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
vim.opt.swapfile = false

-- UI settings
vim.opt.number = true
vim.opt.scrolloff = 2
vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.foldmethod = "indent"
vim.opt.foldnestmax = 1
vim.opt.foldlevelstart = 1

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true

-- Navigation and buffers
vim.opt.autochdir = true
vim.opt.hidden = true

-- Clipboard
vim.opt.clipboard:append("unnamed")
vim.opt.clipboard:append("unnamedplus")

-- Colors and appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- Spell checking
vim.cmd("language en_GB.utf8")
vim.opt.spell = true
vim.opt.spelllang = "en_gb"

-- Status line
vim.opt.statusline = "%F"

-- Netrw settings (using vim.g for global variables)
vim.g.netrw_browse_split = 3
vim.g.tex_flavor = "latex"

-- Colorscheme
vim.cmd("colorscheme gruvbox-material")

-- Shortcut to display warnings in current line
vim.api.nvim_set_keymap("n", "<F2>", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- Start COQ, Blamer, and treesitter after loading everything.
local function after_load()
    -- Start COQ
    vim.cmd("COQnow --shut-up")
    -- Start Blamer
    vim.cmd("BlamerToggle")
    -- Start tree-sitter
    vim.treesitter.start()
end

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = {'*.tex', '*.c', '*.lua', '*.py', '*.ts'},
    nested = true,
    callback = after_load
})

