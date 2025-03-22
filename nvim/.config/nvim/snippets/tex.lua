local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

return {
  s("\\begin", fmta([[
  \begin{<>}
      <>
  \end{<>}
  ]], { i(1), i(2), rep(1) }))
}, {
  s(".baa", fmta([[
  \begin{align*}
      <>
  \end{align*}
  ]], { i(1) })),

  s(".bal", fmta([[
  \begin{align}
      <>
  \end{align}
  ]], { i(1) })),

  -- s(".bb", fmta([[
  -- \begin{bmatrix}
  --     <>
  -- \end{bmatrix}
  -- ]], { i(1) })),

  s(".bc", fmta([[
  \begin{bmatrix} <> \end{bmatrix}
  ]], { i(1) })),

  s(".bpr", fmta([[
  \begin{problem}[<>]
      <>
  \end{problem}
  ]], { i(1), i(2) })),

  s(".bso", fmta([[
  \begin{solution}
      <>
  \end{solution}
  ]], { i(1) })),

  s(".sq", fmta([[
  \sqrt{<>}
  ]], { i(1) })),

  s(".fr", fmta([[
  \frac{<>}{<>}
  ]], { i(1), i(2) })),

  s(".th", fmta([[
  \theta
  ]], {})),

  s(".bx", fmta([[
  \boxed{<>}
  ]], { i(1) })),

  s(".tx", fmta([[
  \text{<>}
  ]], { i(1) })),

  s(".tb", fmta([[
  \textbf{<>}
  ]], { i(1) })),

  s(".ts", fmta([[
  \textsf{<>}
  ]], { i(1) })),

  s(".bfig", fmta([[
  \begin{figure}[H]
      \centering
      \includegraphics[scale=0.5]{<>}
  \end{figure}
  ]], { i(1) })),

  s(".bea", fmta([[
  \begin{enumerate}[label=(\alph*)]
      \item <>
  \end{enumerate}
  ]], { i(1) })),

  s(".bee", fmta([[
  \begin{enumerate}
      \item <>
  \end{enumerate}
  ]], { i(1) })),

  s(".mat", fmta([[
  \begin{bmatrix}
      <>
  \end{bmatrix}
  ]], { i(1) })),

  s(".eq", fmta([[
  \[
  <>
  \]
  ]], { i(1) })),

  s(".bb", fmta([[
  \mathbb{<>}
  ]], { i(1) })),

  s(".N", fmta([[
  \mathbb{N}
  ]], {})),

  s(".R", fmta([[
  \mathbb{R}
  ]], {})),

  s(".Z", fmta([[
  \mathbb{Z}
  ]], {})),

  s(".Q", fmta([[
  \mathbb{Q}
  ]], {})),

  s(".par", fmta([[
  \partial
  ]], {})),

  s(".lr", fmta([[
  \left(<>\right)
  ]], { i(1) })),

  s(".doc", fmta([[
  \documentclass{article}
  \usepackage{amssymb, amsmath, amsfonts, amsthm, graphicx, enumitem}

  \title{<>}
  \author{}
  \date{}

  \begin{document}
  \maketitle
  <>
  \end{document}
  ]], { i(1), i(2) })),

  s(".sum", fmta([[
  \sum_{i=<>}^<>
  ]], { i(1), i(2) })),

  s(".ms", fmta([[
  \mathscr{<>}
  ]], { i(1) })),

  s(".mc", fmta([[
  \mathcal{<>}
  ]], { i(1) })),

  s(".tr", fmta([[
  \trianglelefteq
  ]], {})),

  s(".ss", fmta([[
  \subset
  ]], {})),

  s(".se", fmta([[
  \subseteq
  ]], {})),

  s(".qs", fmta([[
  \sqsubseteq
  ]], {})),
}
