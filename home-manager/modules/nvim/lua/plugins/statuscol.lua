return {
  "luukvbaal/statuscol.nvim",
  -- enabled = true,
  opts = function(_, opts)
    -- vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#A2AAAD" })
    -- vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#8c3f3a" })
    -- vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#3a878c" })
    -- vim.api.nvim_set_hl(0, "Status_LineNr", { fg = "#595959" })
    -- vim.api.nvim_set_hl(0, "Status_DivLine", { bg = "#1d2021", fg = "#292929" })

    local builtin = require("statuscol.builtin")
    opts.ft_ignore = { "neo-tree", "grug-far", "Avante", "AvanteInput", "AvanteSelectedFiles" }
    opts.setopt = true
    opts.segments = {
      { text = { "%s" }, click = "v:lua.ScSa" },
      -- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      {
        text = { "%=", "%=", "%{v:lnum}", " " },
        --text = { "%=", "%=", " ", "%{v:lnum}", " " },
        condition = { true, builtin.not_empty },
        click = "v:lua.ScLa",
        hl = "Status_LineNr",
      },
      {
        text = { "%=", "%=", "%{v:relnum}", " " },
        --text = { "%=", "%=", " ", "%{v:relnum}", " " },
        condition = { true, builtin.not_empty },
      },
    }
    return opts
  end,
}
