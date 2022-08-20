return { -- normal snippets
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
		fmt(
			[[
        println!("{{}}", {});
      ]],
			{ i(0) }
		)
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
