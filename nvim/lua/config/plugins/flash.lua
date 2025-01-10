return {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      jump = {
        autojump = true,
      },
      modes = {
        char = {
          jump_labels = true,
          multi_line = false,
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "<leader>gs",     mode = { "n", "x"}, function() require("flash").jump() end,              desc = "Flash" },
      { "<leader>gS",     mode = { "n" },     function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",              mode = "o",         function() require("flash").remote() end,            desc = "Remote Flash" },
    },
  }
