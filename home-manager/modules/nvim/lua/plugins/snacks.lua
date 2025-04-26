-- if true then
--   return {}
-- end

return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        enabled = true,
        matcher = { cwd_bonus = true },
        files = {
          truncate = false,
          hidden = true,
        },
        formatters = {
          file = {
            truncate = 120,
            hidden = true,
          },
        },
      },
      explorer = { enabled = false },
      dashboard = { enabled = false },
      statuscolumn = { enabled = false },
    },
  },
}
