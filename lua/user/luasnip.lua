local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  return
end

-- snippets configuration
luasnip.config.set_config({
  -- remember to keep around the last snippet
  history = true,
  -- enable autoexpanding snippets
  enable_autosnippets = true,
  -- update dynamic snippets while typing
  updateevents = "TextChanged,TextChangedI",
  -- Snippets aren't automatically removed if their text is deleted.
  -- `delete_check_events` determines on which events (:h events) a check for
  -- deleted snippets is performed.
  -- This can be especially useful when `history` is enabled.
  delete_check_events = "TextChanged",
  ext_opts = {
    -- these ext_opts are applied when the node is active (eg. it has been
    -- jumped into, and not out yet).
    active =
    -- this is the table actually passed to `nvim_buf_set_extmark`.
    {
      -- highlight the text inside the node red.
      hl_group = "RedBold"
    },
    -- these ext_opts are applied when the node is not active, but
    -- the snippet still is.
    passive = {
      -- add virtual text on the line of the node, behind all text.
      virt_text = { { "", "BlueBold" } }
    },
  }
})

require("luasnip.loaders.from_lua").lazy_load()
