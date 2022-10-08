return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim", "packer_plugins" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
      format = {
        enable = true,
        defalutConfig = {
          indent_style = "space",
          indent_size = "2",
        },
      },
    },
  },
}
