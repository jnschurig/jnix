-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
-- vim.api.nvim_create_autocmd("VimEnter", {
--   pattern = "*",
--   callback = function()
--     vim.cmd("silent! 1delete _")
--   end,
-- })

-- Exclude neotree from getting line number column
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "neo-tree" then
      vim.opt_local.statuscolumn = ""
    end
  end,
})
