return {
	s(
		{ trig = "main", name = "main function" },
		fmt(
			[[
        #include <stdio.h>

        int
        main()
        {{
          {}

          return 0;
        }}
      ]],
			{ i(1) }
		)
	),
  s(
    { trig = "for", name = "for loop" },
    fmt(
      [[
        for ({} {} = {}; {} {}; {}++)
        {{
          {}
        }}
      ]],
      { i(1, "int"),  i(2, "i"), i(3), rep(2), i(4), rep(2), i(5) }
    )
  ),
  s(
    { trig = "while", name = "while loop" },
    fmt(
      [[
        while ({})
        {{
          {}
        }}
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = "pf", name = "printf" },
    fmt(
      [[
        printf("{}", {});
      ]],
      { i(1), i(2) }
    )
  ),
  s(
    { trig = "if", name = "if" },
    fmt(
      [[
        if ({})
        {{
          {}
        }}
      ]], { i(1), i(2) }
    )
  ),
	s(
		{ trig = "struct", name = "struct" },
		fmt(
			[[
        struct {}
        {{
          {}
        }};
      ]],
			{ i(1), i(2) }
		)
	),
}, {}
