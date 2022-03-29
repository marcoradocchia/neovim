return { -- triggered
  s(
  { trig = "pc", name = "protected call/check" },
  fmt([[
      local {}, status_ok = pcall(require, "{}")
      if not status_ok then
        return
      end
    ]], { i(1), rep(1) })
  ),
}, { -- autotriggered

}
