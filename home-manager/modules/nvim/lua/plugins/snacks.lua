return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = { enabled = true },
      explorer = { enabled = true },
    },
  },
  config = function()
    vim.api.nvim_set_hl(0, "SnacksGitIgnored", { fg = "#a5bcca", bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "SnacksGitUnstaged", { fg = "#a5bcca", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusIgnored", { fg = "#a5bcca", bg = "none", italic = true })
    vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { fg = "#a5bcca", bg = "none", bold = true })
    vim.api.nvim_set_hl(0, "SnacksPickerUnselected", { fg = "#a5bcca", bg = "none", bold = true })
  end,
}
