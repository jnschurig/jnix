-- if true then
--   return {}
-- end

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    update_focused_file = {
      enable = true,
    },
    filesystem = {
      filtered_items = {
        never_show = {
          "__pycache__",
          ".DS_Store",
          ".ropeproject",
          ".git",
        },
        never_show_by_pattern = {
          "*.pyc",
          ".*cache",
        },
        visible = false, -- when true, they will just be displayed differently than normal items
        hide_dotfiles = false,
        hide_gitignored = false,
        always_show_by_pattern = { -- uses glob style patterns
          -- ".env*",
        },
      },
    },
  },
}
