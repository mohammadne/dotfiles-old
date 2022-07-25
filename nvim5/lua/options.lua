--------------------------------------------------------------------------------------- UI based

vim.opt.number = true           -- Show line number
vim.opt.relativenumber = true   -- Show line number relatively
vim.opt.showmatch = true        -- Highlight matching parenthesis
vim.opt.foldmethod = 'marker'   -- Enable folding (default 'foldmarker')
-- vim.opt.colorcolumn = '80'      -- Line lenght marker at 80 columns
vim.opt.splitright = true       -- Vertical split to the right
vim.opt.splitbelow = true       -- Horizontal split to the bottom
vim.opt.ignorecase = true       -- Ignore case letters when search
vim.opt.smartcase = true        -- Ignore lowercase for the whole pattern
vim.opt.linebreak = true        -- Wrap on word boundary
vim.opt.termguicolors = true    -- Enable 24-bit RGB colors
vim.opt.laststatus=3            -- Set global statusline

--------------------------------------------------------------------------------------- Tabs, indent

vim.opt.expandtab = true        -- Use spaces instead of tabs
vim.opt.shiftwidth = 4          -- Shift 4 spaces when tab
vim.opt.tabstop = 4             -- 1 tab == 4 spaces
vim.opt.smartindent = true      -- Autoindent new lines

--------------------------------------------------------------------------------------- Memory, CPU

vim.opt.hidden = true           -- Enable background buffers
vim.opt.history = 100           -- Remember N lines in history
vim.opt.lazyredraw = true       -- Faster scrolling
vim.opt.synmaxcol = 240         -- Max column for syntax highlight
vim.opt.updatetime = 700        -- ms to wait for trigger an event

---------------------------------------------------------------------------------------  Misc

vim.opt.clipboard = 'unnamedplus'                  -- Copy/paste to system clipboard
vim.opt.swapfile = false                           -- Don't use swapfile
vim.opt.completeopt = 'menuone,noinsert,noselect'  -- Autocomplete options

