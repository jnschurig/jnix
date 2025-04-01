return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
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
      opts.indent.enable = true
    end,
  },
}
