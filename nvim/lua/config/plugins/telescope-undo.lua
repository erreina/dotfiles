return {
  "debugloop/telescope-undo.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    {
      "<leader>u",
      "<cmd>Telescope undo<cr>",
      desc = "undo history",
    },
  },
  config = function()
    local opts = {
      extensions = {
        undo = {
          use_delta = true,
          side_by_side = false,
          saved_only = false,
          mappings = {
            i = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
            n = {
              ["<cr>"] = require("telescope-undo.actions").restore,
            },
          },
        },
      },
    }
    require("telescope").setup(opts)
    require("telescope").load_extension("undo")
  end,
}
