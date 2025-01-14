return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "json",
        "json5",
        "lua",
        "python",
        "yaml",
        "toml",
        "terraform",
        "nix",
        "bash",
        "c",
        "html",
        "luadoc",
        "markdown",
        "vim",
        "vimdoc",
      })
      opts.indent.enable = true
    end,
  },
}
