return function (luasnip)
  local s = luasnip.snippet
  local t = luasnip.text_node
  local i = luasnip.insert_node
  local f = luasnip.function_node
  local d = luasnip.dynamic_node
  local c = luasnip.choice_node
  local sn = luasnip.snippet_node

  local function rec_ls ()
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

  local function date ()
    return os.date("%Y-%m-%d")
  end

  luasnip.snippets = {
    tex = {
      -- begin/end
      s(
        {
          trig = "beg",
          name = "begin/end",
        },
        {
          t("\\begin{"), i(1), t({"}", "\t"}),
          i(2),
          t({"", "\\end{"}),
          f(function(args) return args[1][1] end, {1}),
          t({"}", ""}),
          i(0),
        }
      ),
      -- chapter
      s(
        {
          trig = "chap",
          name = "capter",
        },
        {
          t("\\chapter{"), i(1), t("} % "), f(date, {}),
          t({"", ""}), i(0),
        }
      ),
      -- section
      s(
        {
          trig = "sec",
          name = "section",
        },
        {
          t("\\section{"), i(1), t({"}", ""}), i(0),
        }
      ),
      -- subsection
      s(
        {
          trig = "ssec",
          name = "subsection",
        },
        {
          t("\\subsection{"), i(1), t({"}", ""}), i(0),
        }
      ),
      -- subsubsection
      s(
        {
          trig = "sssec",
          name = "subsubsection",
        },
        {
          t("\\subsubsection{"), i(1), t({"}", ""}), i(0),
        }
      ),
      -- paragraph
      s(
        {
          trig = "par",
          name = "paragraph",
        },
        {
          t("\\paragraph{"), i(1), t({"}", ""}), i(0),
        }
      ),
      -- footnote
      s(
        {
          trig = "foot",
          name = "footnote",
        },
        {
          t({"\\footnote{", "\t"}), i(1), t({"", "}"}), i(0),
        }
      ),
      -- equation block
      s(
        {
          trig = "eq",
          name = "equation",
        }, {
          t({"\\begin{equation}", "\t"}),
          i(1),
          t({"", "\\end{equation}", ""}),
          i(0),
        }
      ),
      -- align block
      s(
        {
          trig = "al",
          name = "align",
        },
        {
          t({"\\begin{align}", "\t"}),
          i(1),
          t({"", "\\end{align}", ""}),
          i(0),
        }
      ),
      -- dcases block
      s(
        {
          trig = "cases",
          name = "dcases",
        },
        {
          t({"\\begin{dcases}", "\t"}),
          i(1),
          t({"", "\\end{dcases}", ""}),
          i(0),
        }
      ),
      -- itemize
      s(
        {
          trig = "item",
          name = "itemize",
        },
        {
          t({"\\begin{itemize}", "\t\\item "}),
          i(1),
          d(2, rec_ls, {}),
          t({"", "\\end{itemize}", ""}),
        }
      ),
      -- enumerate
      s(
        {
          trig = "enum",
          name = "enumerate",
        },
        {
          t({"\\begin{enumerate}", "\t\\item "}),
          i(1),
          d(2, rec_ls, {}),
          t({"", "\\end{enumerate}", ""}),
        }
      ),
      -- pmatrix
      s(
        {
          trig = "pmat",
          name = "pmatrix"
        },
        {
          t({"\\begin{pmatrix}", "\t"}),
          i(1),
          t({"", "\\end{pmatrix}"}),
          i(0),
        }
      ),
      -- bmatrix
      s(
        {
          trig = "bmat",
          name = "bmatrix"
        },
        {
          t({"\\begin{bmatrix}", "\t"}),
          i(1),
          t({"", "\\end{bmatrix}"}),
          i(0),
        }
      ),
      -- cmatrix
      s(
        {
          trig = "cmat",
          name = "cmatrix"
        },
        {
          t({"\\begin{cmatrix}", "\t"}),
          i(1),
          t({"", "\\end{cmatrix}"}),
          i(0),
        }
      ),
      -- theorem
      s(
        {
          trig = "thm",
          name = "theorem",
        },
        {
          t("\\begin{theorem}["), i(1), t({"]", "\t"}),
          i(2),
          t({"", "\\end{theorem}", ""}),
          i(0),
        }
      ),
      -- proof
      s(
        {
          trig = "prf",
          name = "proof",
        },
        {
          t({"\\begin{proof}", "\t"}),
          i(1),
          t({"", "\\end{proof}", ""}),
          i(0),
        }
      ),
      -- definition
      s(
        {
          trig = "def",
          name = "definition",
        },
        {
          t("\\begin{definition}["), i(1), t({"]", "\t"}),
          i(2),
          t({"", "\\end{definition}", ""}),
          i(0),
        }
      ),
      -- lemma
      s(
        {
          trig = "lem",
          name = "lemma",
        },
        {
          t("\\begin{lemma}["), i(1), t({"]", "\t"}),
          i(2),
          t({"", "\\end{lemma}", ""}),
          i(0),
        }
      ),
      -- note
      s(
        {
          trig = "note",
          name = "note",
        },
        {
          t("\\begin{note}["), i(1), t({"]", "\t"}),
          i(2),
          t({"", "\\end{note}", ""}),
          i(0),
        }
      ),
      -- example
      s(
        {
          trig = "examp",
          name = "example",
        },
        {
          t("\\begin{example}["), i(1), t({"]", "\t"}),
          i(2),
          t({"", "\\end{example}", ""}),
          i(0),
        }
      ),
      -- text
      s(
        {
          trig = "text",
          name = "text",
        },
        {
          t("\\text{"), i(1), t("}"), i(0),
        }
      ),
      -- lim
      s(
        {
          trig = "lim",
          name = "limit",
        },
        {
          t("\\lim_{"), i(1), t(" \\to "), i(2), t("}"), i(0),
        }
      ),
      -- square root
      s(
        {
          trig = "sqrt",
          name = "square root",
        },
        {
          t("\\sqrt{"), i(1), t("}"), i(0),
        }
      ),
      -- hat
      s(
        {
          trig = "hat",
          name = "hat",
        },
        {
          t("\\hat{"), i(1), t("}"), i(0),
        }
      ),
      -- sine
      s(
        {
          trig = "sin",
          name = "sine",
        },
        {
          t("\\sin"), i(0),
        }
      ),
      -- cosine
      s(
        {
          trig = "cos",
          name = "cosine",
        },
        {
          t("\\cos"), i(0),
        }
        ),
      -- complex conjugate
      s(
        {
          trig = "cc",
          name = "complex conjugate",
        },
        {
          t("\\cc{"), i(1), t("}"), i(0),
        }
      ),
      -- vector
      s(
        {
          trig = "vec",
          name = "vector",
        },
        {
          t("\\vec{"), i(1), t("}"), i(0),
        }
      ),
      -- bra
      s(
        {
          trig = "<|",
          name = "bra",
        },
        {
          t("\\bra{"), i(1), t("}"), i(0),
        }
      ),
      -- ket
      s(
        {
          trig = "|>",
          name = "ket",
        },
        {
          t("\\ket{"), i(1), t("}"), i(0),
        }
      ),
      -- bra-ket
      s(
        {
          trig = "<>",
          name = "bra-ket",
        },
        {
          t("\\braket{"), i(1), t("}"), i(0),
        }
      ),
      -- partial
      s(
        {
          trig = "part",
          name = "partial",
        },
        {
          t("\\partial")
        }
      ),
      -- reference
      s(
        {
          trig = "ref",
          name = "reference",
        },
        {
          t("\\ref{"), i(1), t("}"), i(0),
        }
      ),
      -- inline code block
      s(
        {
          trig = "lncode",
          name = "lstinline",
        },
        {
          t("\\lstinline{"), i(1), t("}"), i(0),
        }
      ),
      -- code block
      s(
        {
          trig = "code",
          name = "lstlisting",
        },
        {
          t({"\\begin{lstlisting}", ""}),
          i(1), t("\\end{lstlisting}"), i(0),
        }
      ),
      -- figure
      s(
        {
          trig = "fig",
          name = "figure",
        },
        {
          t("\\begin{figure}["),
          i(1), t({"]", "\\centering", "\t\\includegraphics[width="}),
          i(2), t({"\\textwidth]{./imgs/chap"}), i(3), t("/"), i(4),
          t({".jpg}", "\t\\caption{"}), i(5), t({"}", "\t\\label{fig:"}),
          i(6), t({"}", "\\end{figure}", ""}),
          i(0),
        }
      ),
      -- inkscape figure
      s(
        {
          trig = "inkfig",
          name = "inkscape figure",
        },
        {
          t("\\begin{figure}["),
          i(1), t({"]", "\\centering", "\t\\incfig["}),
          i(2), t({"]{./imgs/chap"}), i(3), t("/}{"), i(4),
          t({"}", "\t\\caption{"}), i(5), t({"}", "\t\\label{fig:"}),
          i(6), t({"}", "\\end{figure}", ""}),
          i(0),
        }
      ),
      -- integral
      s(
        {
          trig = "mint",
          name = "integral",
        },
        {
          t("\\mint{"), i(1), t("}{"), i(2), t("}{"), i(3),
          t("}{"), i(4), t("}"), i(0),
        }
      ),
      -- inf integral
      s(
        {
          trig = "infint",
          name = "inf integral",
        },
        {
          t("\\infint{"), i(1), t("}{"), i(2), t("}"), i(0),
        }
      ),
      -- o integral
      s(
        {
          trig = "moint",
          name = "o integral",
        },
        {
          t("\\moint{"), i(1), t("}{"), i(2), t("}{"), i(3),
          t("}"), i(0),
        }
      ),
      -- differential
      s(
        {
          trig = "md",
          name = "differential",
        },
        {
          t("\\md{"), i(1), t("}"), i(0),
        }
      ),
      -- derivative
      s(
        {
          trig = "mdv",
          name = "derivative",
        },
        {
          t("\\mdv{"), i(1), t("}{"), i(2), t("}"), i(0),
        }
      ),
      -- partial derivative
      s(
        {
          trig = "mpdv",
          name = "partial derivative",
        },
        {
          t("\\mpdv{"), i(1), t("}{"), i(2), t("}"), i(0),
        }
      ),
      -- sum
      s(
        {
          trig = "sum",
          name = "sum",
        },
        {
          t("\\sum_{"), i(1), t("}^{"), i(2), t("}"), i(0),
        }
      ),
      --TODO: make automatic
      -- code from file
      s(
        {
          trig = "incode",
          name = "lstinputlisting"
        },
        {
          t("\\lstinputlisting{./src/chap"), i(1),
          t("/src"), i(2),
          t("."),i(3), t({"}", ""}),
          i(0),
        }
      ),
    },
  }

  luasnip.autosnippets = {
    tex = {
      -- round brackets
      s(
        {
          trig = "((",
          name = "round brackets",
        },
        {
          t("\\mrb{"), i(1), t("}"), i(0),
        }
      ),
      -- square brackets
      s(
        {
          trig = "[[",
          name = "square brackets",
        }, {
          t("\\msb{"), i(1), t("}"), i(0),
        }
      ),
      -- curly brackets
      s(
        {
          trig = "{{",
          name = "curly brackets",
        }, {
          t("\\mcb{"), i(1), t("}"), i(0),
        }
      ),
      -- bold text
      s(
        {
          trig = "btt",
          name = "bold text",
        }, {
          t("\\textbf{"), i(1), t("}"), i(0)
        }
      ),
      -- italics text
      s(
        {
          trig = "itt",
          name = "italics text",
        }, {
          t("\\textit{"), i(1), t("}"), i(0)
        }
      ),
      -- quotation marks
      s(
        {
          trig = "``",
          name = "quotation marks",
        }, {
          t("``"), i(1), t("'' "), i(0)
        }
      ),
      -- inline math
      s(
        {
          trig = "mk",
          name = "inline math",
        }, {
          t("$"), i(1), t("$"), i(0),
        }
      ),
      -- math block
      s(
        {
          trig = "dm",
          name = "math block",
        }, {
          t({"\\[", "\t"}),
          i(1),
          t({"", "\\]", ""}),
          i(0),
        }
      ),
      -- fraction
      s(
        {
          trig = "//",
          name = "fraction",
        }, {
          t("\\frac{"), i(1), t("}{"), i(2), t("}"), i(0),
        }
      ),
      -- abs
      s(
        {
          trig = "||",
          name = "absolute value",
        }, {
          t("\\abs{"), i(1), t("}"), i(0),
        }
      ),
      -- superscript
      s(
        {
          trig = "^",
          name = "superscript",
        },{
          t("^{"), i(1), t("}"), i(0),
        }
      ),
      -- subscript
      s(
        {
          trig = "_",
          name = "subscript",
        },{
          t("_{"), i(1), t("}"), i(0),
        }
      ),
      -- grater equal
      s(
        {
          trig = ">=",
          name = "grater equal",
        }, {
          t("\\geq ")
        }
      ),
      -- less equal
      s(
        {
          trig = "<=",
          name = "less equal",
        }, {
          t("\\leq ")
        }
      ),
      -- not equal
      s(
        {
          trig = "!=",
          name = "not equal",
        }, {
          t("\\neq ")
        }
      ),
      -- equivalent
      s(
        {
          trig = "==",
          name = "equivalent",
        }, {
          t("\\equiv ")
        }
      ),
      -- rightarrow
      s(
        {
          trig = "->",
          name = "rightarrow",
        }, {
          t("\\rightarrow ")
        }
      ),
      -- leftarrow
      s(
        {
          trig = "<-",
          name = "leftarrow",
        }, {
          t("\\leftarrow ")
        }
      ),
      -- xrightarrow
      s(
        {
          trig = "x->",
          name = "xrightarrow",
        }, {
          t("\\xrightarrow ")
        }
      ),
      -- Rightarrow
      s(
        {
          trig = "=>",
          name = "Rightarrow",
        }, {
          t("\\Rightarrow ")
        }
      ),
      -- greek and math symbols
      s("`a", t("\\alpha")),
      s("`b", t("\\beta")),
      s("`d", t("\\delta")),
      s("`D", t("\\Delta")),
      s("`e", t("\\eps")),
      s("`f", t("\\varphi")),
      s("`F", t("\\phi")),
      s("`g", t("\\gamma")),
      s("`G", t("\\Gamma")),
      s("`h", t("\\hbar")),
      s("`H", t("\\ham")),
      s("`l", t("\\lambda")),
      s("`L", t("\\lag")),
      s("`m", t("\\mu")),
      s("`n", t("\\eta")),
      s("`o", t("\\omega")),
      s("`O", t("\\Omega")),
      s("`p", t("\\psi")),
      s("`P", t("\\pi")),
      s("`r", t("\\rho")),
      s("`t", t("\\theta")),
      s("`T", t("\\Theta")),
      s("`v", t("\\nu")),
      s("`x", t("\\chi")),
      s("`X", t("\\xi")),
      s("darr", t("\\downarrow")),
      s("uarr", t("\\uparrow")),
    }
  }
end
