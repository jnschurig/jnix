-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Create an autocommand for when the colorscheme changes
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  pattern = "*",
  callback = function()
    -- catppuccin colors
    -- local colors = require("catppuccin").options.color_overrides.frappe
    -- vim.api.nvim_set_hl(0, "LineNr", { fg = "#ebdbb2" })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#d8a657" })
    -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#ea6962" })
    -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#7daea3" })
    -- vim.api.nvim_set_hl(0, "Status_LineNr", { fg = "#595959" })
    -- vim.api.nvim_set_hl(0, "Status_DivLine", { bg = "#1d2021", fg = "#292929" })

    -- vim.api.nvim_set_hl(0, "LineNr", { fg = colors.text })
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = colors.yellow })
    -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = colors.red })
    -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = colors.blue })
    -- vim.api.nvim_set_hl(0, "Status_LineNr", { fg = colors.overlay0 })
    -- vim.api.nvim_set_hl(0, "Status_DivLine", { bg = colors.base, fg = colors.surface2 })

    -- Display the second status column
    vim.opt.statuscolumn = "%C%s%=%#Status_LineNr#%=%l %* %=%r%* %#Status_DivLine#⏐%*"
  end,
})
