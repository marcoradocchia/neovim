local function rec_ls()
	return sn(
		nil,
		c(1, {
			-- Order is important, sn(...) first would cause infinite loop of
			-- expansion.
			t(""),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		})
	)
end

local function date()
	return os.date("%Y-%m-%d")
end

return { -- TRIGGERED
	-- begin/end
	s(
		{ trig = "beg", name = "begin/end" },
		fmt(
			[[
        \begin{{{}}}
          {}
        \end{{{}}}{}
      ]],
			{ i(1), i(2), rep(1), i(0) }
		)
	),
	-- chapter
	s(
		{ trig = "chap", name = "capter" },
		fmt(
			[[
        \chapter{{{}}}
        {}
      ]],
			{ date(), i(0) }
		)
	),
	-- section
	s(
		{ trig = "sec", name = "section" },
		fmt(
			[[
        \section{{{}}}
        {}
      ]],
			{ i(1), i(0) }
		)
	),
	-- subsection
	s(
		{ trig = "ssec", name = "subsection" },
		fmt(
			[[
        \subsection{{{}}}
        {}
      ]],
			{ i(1), i(0) }
		)
	),
	-- subsubsection
	s(
		{ trig = "sssec", name = "subsubsection" },
		fmt(
			[[
        \subsubsection{{{}}}
        {}
      ]],
			{ i(1), i(0) }
		)
	),
	-- paragraph
	s(
		{ trig = "par", name = "paragraph" },
		fmt(
			[[
        \paragraph{{{}}}
        {}
      ]],
			{ i(1), i(0) }
		)
	),
	-- footnote
	s(
		{ trig = "foot", name = "footnote" },
		fmt(
			[[
        \footnote{{
          {}
        }}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- boxed
	s(
		{ trig = "box", name = "boxed" },
		fmt(
			[[
        \boxed{{
          {}
        }}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- named & boxed
	s(
		{ trig = "nbox", name = "named & boxed" },
		fmt(
			[[
        \textbf{{{}}}
        \qquad
        \boxed{{
          {}
        }}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- equation
	s(
		{ trig = "eq", name = "equation" },
		fmt(
			[[
        \begin{{equation}}
          {}
        \end{{equation}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- unnumbered equation
	s(
		{ trig = "eq*", name = "equation*" },
		fmt(
			[[
        \begin{{equation*}}
          {}
        \end{{equation*}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- align block
	s(
		{ trig = "al", name = "align" },
		fmt(
			[[
        \begin{{align}}
          {}
        \end{{align}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- unnumbered align block
	s(
		{ trig = "al*", name = "align*" },
		fmt(
			[[
        \begin{{align*}}
          {}
        \end{{align*}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- dcases block
	s(
		{ trig = "cases", name = "dcases" },
		fmt(
			[[
        \begin{{dcases}}
          {}
        \end{{dcases}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- gathered block
	s(
		{ trig = "gath", name = "gathered" },
		fmt(
			[[
        \begin{{gathered}}
          {}
        \end{{gathered}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- itemize
	s(
		{ trig = "item", name = "itemize" },
		fmt(
			[[
        \begin{{itemize}}
          \item {}
          \item {}
        \end{{itemize}}{}
      ]],
			{ i(1), d(2, rec_ls, {}), i(0) }
		)
	),
	-- enumerate
	s(
		{ trig = "enum", name = "enumerate" },
		fmt(
			[[
        \begin{{enumerate}}
          \item {}
          \item {}
        \end{{enumerate}}{}
      ]],
			{ i(1), d(2, rec_ls, {}), i(0) }
		)
	),
	-- pmatrix
	s(
		{ trig = "pmat", name = "pmatrix" },
		fmt(
			[[
        \begin{{pmatrix}}
          {}
        \end{{pmatrix}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- bmatrix
	s(
		{ trig = "bmat", name = "bmatrix" },
		fmt(
			[[
        \begin{{bmatrix}}
          {}
        \end{{bmatrix}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- cmatrix
	s(
		{ trig = "cmat", name = "cmatrix" },
		fmt(
			[[
        \begin{{cmatrix}}
          {}
        \end{{cmatrix}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- theorem
	s(
		{ trig = "thm", name = "theorem" },
		fmt(
			[[
        \begin{{theorem}}[{}]
          {}
        \end{{theorem}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- corollary
	s(
		{ trig = "cor", name = "corollary" },
		fmt(
			[[
        \begin{{corollary}}[{}]
          {}
        \end{{corollary}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- proof
	s(
		{ trig = "prf", name = "proof" },
		fmt(
			[[
        \begin{{proof}}
          {}
        \end{{proof}}
      ]],
			{ i(0) }
		)
	),
	-- definition
	s(
		{ trig = "def", name = "definition" },
		fmt(
			[[
        \begin{{definition}}[{}]
          {}
        \end{{definition}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- lemma
	s(
		{ trig = "lem", name = "lemma" },
		fmt(
			[[
        \begin{{lemma}}[{}]
          {}
        \end{{lemma}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- note
	s(
		{ trig = "note", name = "note" },
		fmt(
			[[
        \begin{{note}}[{}]
          {}
        \end{{note}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- example
	s(
		{ trig = "examp", name = "example" },
		fmt(
			[[
        \begin{{example}}[{}]
          {}
        \end{{example}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- exercise
	s(
		{ trig = "exer", name = "exercise" },
		fmt(
			[[
        \begin{{exercise}}[{}]
          {}
        \end{{exercise}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- question
	s(
		{ trig = "quest", name = "question" },
		fmt(
			[[
        \begin{{question}}[{}]
          {}
        \end{{question}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
	-- text
	s({ trig = "tt", name = "text" }, fmt("\\text{{{}}}{}", { i(1), i(0) })),
	-- lim
	s({ trig = "lim", name = "limit" }, fmt("\\lim_{{{}\\to {}}}{}", { i(1), i(2), i(0) })),
	-- square root
	s({ trig = "sr", name = "square root" }, fmt("\\sqrt{{{}}}{}", { i(1), i(0) })),
	-- hat
	s({ trig = "hat", name = "hat" }, fmt("\\hat{{{}}}{}", { i(1), i(0) })),
	-- sine
	s({ trig = "sin", name = "sine" }, t("\\sin ")),
	-- cosine
	s({ trig = "cos", name = "cosine" }, t("\\cos ")),
	-- complex conjugate
	s({ trig = "cc", name = "complex conjugate" }, fmt("\\cc{{{}}}{}", { i(1), i(0) })),
	-- vector
	s({ trig = "vec", name = "vector" }, fmt("\\vec{{{}}}{}", { i(1), i(0) })),
	-- quadrivector
	s({ trig = "qvec", name = "quadrivector" }, fmt("\\qvec{{{}}}{}", { i(1), i(0) })),
	-- bra
	s({ trig = "<|", name = "bra" }, fmt("\\bra{{{}}}{}", { i(1), i(0) })),
	-- ket
	s({ trig = "|>", name = "ket" }, fmt("\\ket{{{}}}{}", { i(1), i(0) })),
	-- bra-ket
	s({ trig = "<.>", name = "bra-ket" }, fmt("\\braket{{{} \\vert {}}}{}", { i(1), i(2), i(0) })),
	-- bra-ket (same state)
	s({ trig = "<>", name = "bra-ket (same state)" }, fmt("\\braket{{{} \\vert {}}}{}", { i(1), rep(1), i(0) })),
	-- matrix element
	s(
		{ trig = "<x>", name = "matrix element" },
		fmt("\\braket{{{} \\vert {} \\vert {}}}{}", { i(1), i(2), i(3), i(0) })
	),
	-- mean value over a state
	s(
		{ trig = "<X>", name = "mean value over a state" },
		fmt("\\braket{{{} \\vert {} \\vert {}}}{}", { i(1), i(2), rep(1), i(0) })
	),
	-- mean value
	s({ trig = "<M>", name = "mean value" }, fmt("\\braket{{{}}}{}", { i(1), i(0) })),
	-- partial
	s({ trig = "part", name = "partial" }, t("\\partial ")),
	-- reference
	s({ trig = "ref", name = "reference" }, fmt("\\ref{{{}}}{}", { i(1), i(0) })),
	-- inline code block
	s({ trig = "lncode", name = "lstinline" }, fmt("\\lstinline{{{}}}{}", { i(1), i(0) })),
	-- figure
	s(
		{ trig = "fig", name = "figure" },
		fmt(
			[[
        \begin{{figure}}[{}]
          \centering
          \includegraphics[width={}\\textwidth]{{./img/{}/{}.jpg}}
          \caption{{{}}}
          \label{{fig:{}}}
        \end{{figure}}
        {}
      ]],
			{ i(1), i(2), i(3), i(4), i(5), i(6), i(0) }
		)
	),
	-- inkscape figure
	s(
		{ trig = "inkfig", name = "inkscape figure" },
		fmt(
			[[
        \begin{{figure}}[{}]
          \centering
          \incfig[{}\textwidth]{{./img/{}}}{{{}}}
          \caption{{{}}}
          \label{{fig:{}}}
        \end{{figure}}
        {}
      ]],
			{ i(1), i(2), i(3), i(4), i(5), i(6), i(0) }
		)
	),
	-- integral
	s(
    { trig = "mint", name = "integral" },
    fmt(
      "\\mint{{{}}}{{{}}}{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(4), i(0) }
    )
  ),
	-- double integral
	s(
		{ trig = "dint", name = "double integral" },
		fmt(
      "\\dint{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(0) }
    )
	),
	-- triple integral
	s(
		{ trig = "tint", name = "triple integral" },
		fmt(
			"\\tint{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{{{}}}{}",
			{ i(1), i(2), i(3), i(4), i(5), i(6), i(7), i(8), i(9), i(10), i(0) }
		)
	),
	-- inf integral
	s(
    { trig = "infint", name = "inf integral" },
    fmt(
      "\\infint{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- o integral
	s(
    { trig = "moint", name = "o integral" },
    fmt(
      "\\moint{{{}}}{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(0) }
    )
  ),
	-- indefinite integral
	s(
    { trig = "miint", name = "indefinite integral" },
    fmt(
      "\\miint{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- indefinite double integral
	s(
		{ trig = "midint", name = "indefinite integral" },
		fmt(
      "\\midint{{{}}}{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(0) }
    )
	),
	-- indefinite triple integral
	s(
		{ trig = "mitint", name = "indefinite integral" },
		fmt(
      "\\mitint{{{}}}{{{}}}{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(4), i(0) }
    )
	),
	-- differential
	s(
    { trig = "md", name = "differential" },
    fmt(
      "\\md[{}]{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- derivative
	s(
    { trig = "mdv", name = "derivative" },
    fmt(
      "\\mdv{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- total derivative
	s(
    { trig = "mDv", name = "derivative" },
    fmt(
      "\\mDv{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- partial derivative
	s(
    { trig = "mpdv", name = "partial derivative" },
    fmt("\\mpdv[{}]{{{}}}{{{}}}{}",
      { i(1), i(2), i(3), i(0) }
    )
  ),
  -- divergence
  s(
    { trig = "mdiv", name = "divergence" },
    fmt("\\mdiv{{{}}}{}",
      { i(1), i(0) }
    )
  ),
  -- gradient
  s(
    { trig = "mgrad", name = "divergence" },
    fmt("\\mgrad{{{}}}{}",
      { i(1), i(0) }
    )
  ),
  -- laplacian
  s(
    { trig = "mlap", name = "laplacian" },
    fmt("\\mlap{{{}}}{}",
      { i(1), i(0) }
    )
  ),
  -- rotor
  s(
    { trig = "mrot", name = "rotor" },
    fmt("\\mrot{{{}}}{}",
      { i(1), i(0) }
    )
  ),
	-- sum
	s(
    { trig = "++", name = "sum" },
    fmt(
      "\\msum{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- prod
	s(
    { trig = "**", name = "prod" },
    fmt(
      "\\mprod{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- input listing
	s(
		{ trig = "incode", name = "lstinputlisting" },
		fmt(
      "\\lstinputlisting{{./src/{}/src{}.{}}}{}",
      { i(1), i(2), i(3), i(0) }
    )
	),
	-- exponential
	s(
    { trig = "exp", name = "exponential" },
    fmt(
      "e^{{{}}}{}",
      { i(1), i(0) }
    )
  ),
	-- intenrational sistem unit
	s(
    { trig = "SI", name = "intenrational sistem" },
    fmt(
      "\\SI{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- pgfplot
	s(
		{ trig = "pgfplot", name = "pgfplot" },
		fmt(
			[[
        \begin{{figure}}
          \centering
          \begin{{tikzpicture}}
            \begin{{axis}}[
              title={},
              xlabel={},
              ylabel={},
            ]
            \end{{axis}}
          \end{{tikzpicture}}
          \caption{{{}}}
          \label{{{}}}
        \end{{figure}}
        {}
      ]],
			{ i(1), i(2), i(3), i(4), i(5), i(0) }
		)
	),
	-- addplot (tizkpicture)
	s(
		{ trig = "addpl", name = "add plot" },
		fmt(
			[[
        \addplot[
          {}
        ] {{{}}};
      ]],
			{ i(1), i(0) }
		)
	),
	-- draw (tizkpicture)
	s(
		{ trig = "draw", name = "tizkpicture draw" },
		fmt(
			[[
        \draw[
          {}
        ] ({});
      ]],
			{ i(1), i(0) }
		)
	),
	-- dot product
  s(
    { trig = "dpr", name = "dot product" },
    fmt(
      "\\dpr{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- wedge product
  s(
    { trig = "wpr", name = "wedge product" },
    fmt(
      "\\wpr{{{}}}{{{}}}{}",
      { i(1), i(2), i(0) }
    )
  ),
	-- table
	s(
		{ trig = "table", name = "table" },
		fmt(
			[[
      \begin{{table}}[{}]
        \centering
        \label{{{}}}
        \caption{{{}}}
        \begin{{tabular}}{{{}}}
          \toprule
          {}
          \midrule
          {}
          \bottomrule
        \end{{tabular}}
      \end{{table}}
      {}
    ]],
			{ i(1), i(2), i(3), i(4), i(5), i(6), i(0) }
		)
	),
	-- cancel
	s(
		{ trig = "cancel", name = "cancel" },
		fmt(
			[[
        \cancel{{{}}}{}
      ]],
			{ i(1), i(0) }
		)
	),
	-- cancelto
	s(
		{ trig = "cancelto", name = "cancel to value" },
		fmt(
			[[
        \cancelto{{{}}}{{{}}}{}
      ]],
			{ i(1), i(2), i(0) }
		)
	),
},
	{ -- AUTOTRIGGERED
		-- todo comment
		s({ trig = "todo", name = "todo comment" }, fmt("% TODO: {}", { i(1) })),
		-- round brackets
		s({ trig = "((", name = "round brackets" }, fmt("\\mrb{{{}}}{}", { i(1), i(0) })),
		-- square brackets
		s({ trig = "[[", name = "square brackets" }, fmt("\\msb{{{}}}{}", { i(1), i(0) })),
		-- curly brackets
		s({ trig = "{{", name = "curly brackets" }, fmt("\\mcb{{{}}}{}", { i(1), i(0) })),
		-- bold text
		s({ trig = "btt", name = "bold text" }, fmt("\\textbf{{{}}}{}", { i(1), i(0) })),
		-- italics text
		s({ trig = "itt", name = "italics text" }, fmt("\\textit{{{}}}{}", { i(1), i(0) })),
		-- sc text
		s({ trig = "sct", name = "sc text" }, fmt("\\textsc{{{}}}{}", { i(1), i(0) })),
		-- quotation marks
		s({ trig = "quot", name = "quotation marks" }, fmt("\\quot{{{}}}{}", { i(1), i(0) })),
		-- inline math
		s({ trig = "mk", name = "inline math" }, fmt("${}${}", { i(1), i(0) })),
		-- math block
		s({ trig = "dm", name = "math block" }, fmt("\\[\n\t{}\n\\]{}", { i(1), i(0) })),
		-- fraction
		s({ trig = "//", name = "fraction" }, fmt("\\frac{{{}}}{{{}}}{}", { i(1), i(2), i(0) })),
		-- abs
		s({ trig = "||", name = "absolute value" }, fmt("\\abs{{{}}}{}", { i(1), i(0) })),
		-- superscript
		s({ trig = "^", name = "superscript" }, fmt("^{{{}}}{}", { i(1), i(0) })),
		-- subscript
		s({ trig = "_", name = "subscript" }, fmt("_{{{}}}{}", { i(1), i(0) })),
		-- grater equal
		s({ trig = ">=", name = "grater equal" }, t("\\geq ")),
		-- way grater then
		s({ trig = ">>", name = "way grater than" }, t("\\gg ")),
		-- less equal
		s({ trig = "<=", name = "less equal" }, t("\\leq ")),
		-- way less then
		s({ trig = "<<", name = "way less than" }, t("\\ll ")),
		-- not equal
		s({ trig = "!=", name = "not equal" }, t("\\neq ")),
		-- equivalent
		s({ trig = "==", name = "equivalent" }, t("\\equiv ")),
    -- dotequal
    s({ trig = ".=", name = "dot equal" }, t("\\doteq ")),
		-- rightarrow
		s({ trig = "->", name = "rightarrow" }, t("\\rightarrow ")),
		-- leftarrow
		s({ trig = "<-", name = "leftarrow" }, t("\\leftarrow ")),
		-- xrightarrow
		s({ trig = "x->", name = "xrightarrow" }, fmt("\\xrightarrow{{{}}} ", { i(1) })),
		-- Rightarrow
		s({ trig = "=>", name = "Rightarrow" }, t("\\Rightarrow ")),
		-- dots
		s({ trig = "...", name = "dots" }, t("\\dots")),
		-- vdots
		s({ trig = "..v", name = "vertical dots" }, t("\\vdots")),
		-- ddots
		s({ trig = "..d", name = "diagonal dots" }, t("\\ddots")),
		-- cdots
		s({ trig = "..c", name = "certered dots" }, t("\\cdots")),
		-- greek and math symbols
		s("`'", t("\\mprime")),
		s("`2'", t("\\mdprime")),
		s("`3'", t("\\mtprime")),
		s("`a", t("\\alpha")),
		s("`b", t("\\beta")),
		s("`C", t("\\mathbb{C}")),
		s("`d", t("\\delta")),
		s("`D", t("\\Delta")),
		s("`e", t("\\eps")),
		s("`f", t("\\varphi")),
		s("`F", t("\\phi")),
		s("`g", t("\\gamma")),
		s("`G", t("\\Gamma")),
		s("`h", t("\\hbar")),
		s("`H", t("\\ham")),
    s("`I", t("\\mathbb{I}")),
		s("`l", t("\\lambda")),
		s("`L", t("\\Lambda")),
		s("`m", t("\\mu")),
		s("`n", t("\\eta")),
		s("`o", t("\\omega")),
		s("`O", t("\\Omega")),
		s("`p", t("\\psi")),
		s("`P", t("\\pi")),
		s("`r", t("\\rho")),
		s("`R", t("\\mathbb{R}")),
		s("`s", t("\\sigma")),
		s("`S", t("\\Sigma")),
		s("`t", t("\\theta")),
		s("`T", t("\\Theta")),
		s("`v", t("\\nu")),
		s("`x", t("\\chi")),
		s("`X", t("\\xi")),
		s("`z", t("\\zeta")),
		s("`~", t("\\tilde")),
		s("darr", t("\\downarrow")),
		s("uarr", t("\\uparrow")),
		s("~=", t("\\simeq")),
		s("const", t("\\text{const}")),
		s("`*", t("\\ast")),
		s("mthen", t("\\mthen")),
	}
