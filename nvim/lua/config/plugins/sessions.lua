return {
  'natecraddock/sessions.nvim',
  config = function()
    require("sessions").setup({
      events = { "VimLeavePre" },
      session_filepath = vim.fn.stdpath("data") .. "/sessions",
      absolute = true,
    })
  end,
}
