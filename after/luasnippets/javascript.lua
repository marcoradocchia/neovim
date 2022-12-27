return { -- triged
	s(
		{ trig = "cl", name = "console log" },
		fmt([[
        console.log({});
    ]], { i(1) })
	),

	s(
		{ trig = "ce", name = "console errror" },
		fmt([[
      console.error({});
    ]], { i(1) })
	),
}, { -- autotriged

}
