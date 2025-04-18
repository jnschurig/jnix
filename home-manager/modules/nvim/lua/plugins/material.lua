return {
  "jnschurig/material.nvim",
  -- branch = "color_tweak",
  lazy = false, -- Ensure it loads on startup
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "design colors"
    require("material").setup({
      disable = { -- This works, but causes the lualine text to be WHITE
        background = false,
      },
      plugins = {
        -- "neo-tree",
      },
      styles = {
        comments = {},
        functions = { bold = true },
        strings = { italic = true },
      },
    })
    vim.cmd.colorscheme("material")
    -- vim.api.nvim_set_hl(0, "NonText", { fg = "#a5bcca" })
    -- config = function()
    vim.api.nvim_set_hl(0, "SnacksGitIgnored", { fg = "#a5bcca", bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "SnacksGitUnstaged", { fg = "#a5bcca", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { fg = "#a5bcca", bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#a5bcca", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "SnacksPickerUnselected", { fg = "#a5bcca", bg = "none", bold = true })
  end,
}
