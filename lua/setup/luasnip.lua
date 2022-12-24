require("luasnip").config.set_config({
  history = false,
  enable_autosnippets = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "InsertLeave",
  -- delete_check_events = "TextChanged",
  ext_opts = {
    active = {
      hl_group = "RedBold"
    },
    passive = {
      virt_text = { { "", "BlueBold" } }
    },
  }
})

require("luasnip.loaders.from_lua").lazy_load()
