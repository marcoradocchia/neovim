return {
  s(
    { trig = "main", name = "main function" },
    fmt([[
      fn main() {{
          {}
      }}
    ]], { i(1) })
  ),
	s(
		{ trig = "pl", name = "print line" },
		fmt(
			[[
        println!("{{}}", {});
      ]],
			{ i(1) }
		)
	),
}, {}
