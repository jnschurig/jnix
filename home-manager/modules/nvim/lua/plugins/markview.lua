return {
  "OXY2DEV/markview.nvim",
  -- dependencies = {
  -- You may not need this if you don't lazy load
  -- Or if the parsers are in your $RUNTIMEPATH
  -- "nvim-treesitter/nvim-treesitter",
  -- "nvim-tree/nvim-web-devicons",
  -- },

  lazy = true,

  opts = {
    experimental = {
      check_rtp = true, -- keep order check on
      check_rtp_message = true, -- show message if wrong
      -- set check_rtp_message=false later if you only want to hide the warning
    },
  },
}
