let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection=0

colorscheme gruvbox
set background=dark

hi MatchParen cterm=underline ctermbg=none ctermfg=none gui=underline guifg=none guibg=none
hi Normal ctermbg=none guibg=none
hi SignColumn ctermbg=none guibg=none
hi GitSignsAdd ctermfg=142 ctermbg=none guifg=#b8bb26 guibg=none
hi GitSignsDelete ctermfg=167 ctermbg=none guifg=#fb4934 guibg=none
hi GitSignsChange ctermfg=108 ctermbg=none guifg=#8ec07c guibg=none
hi CursorLineNr ctermfg=214 ctermbg=none guifg=#fabd2f guibg=none

set termguicolors

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
