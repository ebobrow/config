" Thanks to:
" https://github.com/emmanueljs1/coq-vim-conceal/blob/main/after/syntax/coq.vim

" syn match coqSubscript keepend /\a\d\+/ms=s+1 transparent contains=coqSubscriptDigit
"     \ containedin=ALLBUT,coqComment,coqRequire,coqSubscript,coqSubscriptDigit
" syn match coqSubscriptDigit /0/ contained conceal cchar=₀
" syn match coqSubscriptDigit /1/ contained conceal cchar=₁
" syn match coqSubscriptDigit /2/ contained conceal cchar=₂
" syn match coqSubscriptDigit /3/ contained conceal cchar=₃
" syn match coqSubscriptDigit /4/ contained conceal cchar=₄
" syn match coqSubscriptDigit /5/ contained conceal cchar=₅
" syn match coqSubscriptDigit /6/ contained conceal cchar=₆
" syn match coqSubscriptDigit /7/ contained conceal cchar=₇
" syn match coqSubscriptDigit /8/ contained conceal cchar=₈
" syn match coqSubscriptDigit /9/ contained conceal cchar=₉

syn keyword coqKwd forall conceal cchar=∀
syn keyword coqKwd exists conceal cchar=∃
syn keyword coqKwd fun conceal cchar=λ
syn keyword coqKwd True conceal cchar=⊤
syn keyword coqKwd False conceal cchar=⊥
syntax match coqKwd /\\\// contained conceal cchar=∨
syntax match coqKwd /\/\\/ contained conceal cchar=∧
syntax match coqKwd /|-/ contained conceal cchar=⊢

syn keyword coqLtac forall conceal cchar=∀
syn keyword coqLtac exists conceal cchar=∃
syn keyword coqLtac fun conceal cchar=λ
syn keyword coqLtac True conceal cchar=⊤
syn keyword coqLtac False conceal cchar=⊥
syntax match coqLtac /\\\// contained conceal cchar=∨
syntax match coqLtac /\/\\/ contained conceal cchar=∧
syntax match coqLtac /|-/ contained conceal cchar=⊢
" syntax match coqKwd /\~/ contained conceal cchar=¬
" syn keyword coqKwd Prop conceal cchar=ℙ
" syn keyword coqKwd nat conceal cchar=ℕ
" syn keyword coqKwd bool conceal cchar=𝔹

" hi link coqKwd Operator
" hi! link Conceal Operator

setlocal conceallevel=2
setlocal concealcursor=nci
