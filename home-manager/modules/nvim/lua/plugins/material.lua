return {
  "jnschurig/material.nvim", -- Use your fork
  lazy = false, -- Ensure it loads on startup
  priority = 1000, -- Ensure it loads before other plugins
  config = function()
    -- vim.g.disable_background = true
    vim.g.material_style = "design colors" -- Change to "palenight", "oceanic", etc. if needed
    require("material").setup({
      disable = { -- This works, but causes the lualine text to be WHITE
        background = true,
      },
    })
    vim.cmd.colorscheme("material")
  end,
}
