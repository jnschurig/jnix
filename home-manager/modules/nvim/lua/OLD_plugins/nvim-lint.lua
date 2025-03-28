-- disable this one until the linter is happy...
if true then
  return {}
end

return {
  "mfussenegger/nvim-lint",
  opts = function(_, opts)
    opts.linters_by_ft = {
      markdown = { "markdownlint" },
    }

    local markdownlint = require("lint").linters.markdownlint
    markdownlint.args = {
      "--disable",
      "MD013",
      "--", -- Required
    }
  end,
}
