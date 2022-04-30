return { -- triggered
	s({ trig = "#!", name = "shebang" }, fmt("#!/usr/bin/env sh\n{}", { i(1) })),
}, { -- autotriggered

}
