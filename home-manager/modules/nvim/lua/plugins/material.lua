return {
  "jnschurig/material.nvim", -- Use your fork
  lazy = false, -- Ensure it loads on startup
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "darker" -- Change to "palenight", "oceanic", etc. if needed
    require("material").setup({})
    vim.cmd.colorscheme("material")
  end,
}
