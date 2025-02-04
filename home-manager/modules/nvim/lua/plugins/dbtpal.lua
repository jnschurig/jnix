return {
  "PedramNavid/dbtpal",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  ft = {
    "sql",
    "md",
    "yaml",
  },
  keys = {
    { "<leader>drf", "<cmd>DbtRun<cr>" },
    { "<leader>drp", "<cmd>DbtRunAll<cr>" },
    { "<leader>dtf", "<cmd>DbtTest<cr>" },
    { "<leader>dm", "<cmd>lua require('dbtpal.telescope').dbt_picker()<cr>" },
  },
  config = function()
    require("dbtpal").setup({
      -- This is the config i need for rdbt to work
      path_to_dbt = "python3",
      pre_cmd_args = {
        vim.fn.expand("~/recharge/dbt/rdbt.py"),
        "dev",
        "--use-colors",
        "--printer-width=10",
      },
      path_to_dbt_profiles_dir = nil,
      extended_path_search = true,
      protect_compiled_files = true,
    })
    require("telescope").load_extension("dbtpal")
  end,
}
