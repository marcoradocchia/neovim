return function (luasnip)
  local s = luasnip.snippet
  local t = luasnip.text_node
  local i = luasnip.insert_node

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
          t("$"), i(1), t("$ "), i(0),
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
      s("darr", t("\\downarrow")),
      s("uarr", t("\\uparrow")),
    }
  }
end
