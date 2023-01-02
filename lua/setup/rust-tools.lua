require("rust-tools").setup({
  tools = {
    server = {
      settings = {
        ["rust-analyzer"] = {
          checkOnSave = { command = "clippy" },
          inlayHints = { locationLinks = false },
        }
      },
    },
    inlay_hints = {
      locationLinks = false,
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
      highlight = "Comment",
    },
    hover_actions = {
      border = nil,
    },
  },
})
