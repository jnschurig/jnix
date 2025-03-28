return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
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
      },
    },
  },
}
