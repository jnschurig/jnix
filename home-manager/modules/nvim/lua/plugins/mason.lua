local langs = {
  "black",
  "bashls",
  -- "debugpy",
  -- "docker-compose-language-service",
  -- "dockerls",
  -- "hadolint",
  "isort",
  "jsonls",
  "lua_ls",
  -- "markdown-toc",
  -- "markdownlint",
  -- "markdownlint-cli2",
  -- "marksman",
  -- "nil",
  "basedpyright",
  -- "pylsp",
  "rnix",
  -- "ruff",
  "shellcheck",
  "shfmt",
  -- "sqlfluff",
  -- "sqlls", -- This needs node or go to work right...
  "stylua",
  -- "taplo",
  -- "terraformls",
  -- "tflint",
  "yamlls",
  "yamllint",
}

return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ensure_installed = langs,
      auto_update = true,
    },
  },
}
