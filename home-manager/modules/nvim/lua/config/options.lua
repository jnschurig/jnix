-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local g = vim.g
local o = vim.opt

g.have_nerd_font = true
o.endofline = true
o.fixeol = true
o.breakindent = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
o.ignorecase = true
o.smartcase = true

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 10
