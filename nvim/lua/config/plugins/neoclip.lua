return {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>o",
      "<cmd>Telescope neoclip<cr>",
      desc = "Telescope copy history (neoclip)",
    },
  },
  config = function()
    require("neoclip").setup({
      keys = {
        telescope = {
          i = {
            select = "<cr>",
            delete = "<c-d>",
            edit = "<c-e>",
            paste = "<c-j>",
            paste_behind = "<c-k>",
          }
        }
      }
    })
  end,
}
