let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_invert_selection=0
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme gruvbox
set background=dark

hi Normal ctermbg=none guibg=none
hi SignColumn ctermbg=none guibg=none

" hi GitSignsAdd ctermfg=142 ctermbg=none guifg=#b8bb26 guibg=none
" hi GitSignsDelete ctermfg=167 ctermbg=none guifg=#fb4934 guibg=none
" hi GitSignsChange ctermfg=108 ctermbg=none guifg=#8ec07c guibg=none

hi CursorLineNr ctermfg=214 ctermbg=none guifg=#fabd2f guibg=none
hi VertSplit ctermfg=234 ctermbg=none guifg=#1d2021 guibg=none

hi GruvboxRedSign ctermfg=167 ctermbg=none guifg=#fb4934 guibg=none
hi GruvboxGreenSign ctermfg=142 ctermbg=none guifg=#b8bb26 guibg=none
hi GruvboxYellowSign ctermfg=214 ctermbg=none guifg=#fabd2f guibg=none
hi GruvboxBlueSign ctermfg=109 ctermbg=none guifg=#83a598 guibg=none
hi GruvboxPurpleSign ctermfg=175 ctermbg=none guifg=#d3869b guibg=none
hi GruvboxAquaSign ctermfg=108 ctermbg=none guifg=#8ec07c guibg=none
hi GruvboxOrangeSign ctermfg=208 ctermbg=none guifg=#fe8019 guibg=none

set termguicolors

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
