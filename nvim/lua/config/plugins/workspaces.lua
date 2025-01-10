return {
  'natecraddock/workspaces.nvim',
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    {
      "<leader>fw",
      "<cmd>Telescope workspaces<cr>",
      desc = "Workspaces",
    },
  },
  config = function()
    require("workspaces").setup({
      hooks = {
        open = { "Telescope find_files" },
      }
    })
  end,
}
