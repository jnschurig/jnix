return {
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "OXY2DEV/markview.nvim" }, -- <-- ensure markview loads first
    build = ":TSUpdate",
    opts = function(_, opts)
      opts = opts or {}
      opts.ensure_installed = opts.ensure_installed or {}

      -- extend the list and include markdown_inline
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "c",
        "css",
        "html",
        "json",
        "json5",
        -- "latex",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline", -- important for MD highlights
        "nix",
        "norg",
        "python",
        "scss",
        "svelte",
        "terraform",
        "toml",
        "typst",
        "vim",
        "vimdoc",
        "vue",
        "yaml",
      })

      opts.indent = opts.indent or {}
      opts.indent.enable = true
      return opts
    end,
  },
}
