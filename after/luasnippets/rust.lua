return { -- normal snippets
  s(
    { trig = "new", name = "new associated function" },
    fmt([[
      /// Construct a new instance.
      fn new({}) -> Self {{
        {}
      }}
    ]], { i(1), i(0) })
  ),
  s(
    { trig = "main", name = "main function" },
    fmt([[
      fn main() {{
          {}
      }}
    ]], { i(0) })
  ),

  s(
    { trig = "pl", name = "print line" },
    fmt([[
      println!("{{}}", {});
    ]], { i(0) })
  ),

  s(
    { trig = "res", name = "result" },
    fmt(
      [[
        Result<{}, {}>
      ]],
      { i(1), i(0) }
    )
  )
}, { -- autotriggered snippets
}
