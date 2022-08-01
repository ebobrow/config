setlocal scl=no
augroup TermLineNo
  au!
  au TermEnter term://* setlocal nonu nornu
  au TermLeave term://* setlocal nu rnu
augroup END
