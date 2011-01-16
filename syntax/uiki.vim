" syntax for uiki
"
if exists('b:current_syntax')
  finish
endif

setlocal conceallevel=2
setlocal concealcursor=nc

syntax match uiki_page_link "\[\[.\{-1,}\]\]" contains=uiki_page_block
syntax match uiki_strong /|[^|]\+|/ contains=uiki_strong_bar
syntax match uiki_page_block /\[\[/ contained conceal
syntax match uiki_page_block /\]\]/ contained conceal
syntax match uiki_strong_bar /|/ contained conceal

syntax match uiki_link       "\<http://\S\+"  
syntax match uiki_link       "\<https://\S\+"

syntax match uiki_title0  "^:::.*"
syntax match uiki_title1  "^\*.*" contains=uiki_title1_mark
syntax match uiki_title2  "^\s\{-1,}\*.*"

syntax match uiki_title1_mark "^*" contained conceal


highlight default link uiki_page_link  Underlined
highlight default link uiki_page_block Statement
highlight default link uiki_link       Underlined

highlight uiki_title0 guifg=#FF80FF
highlight uiki_title1 guifg=orange  gui=underline
highlight uiki_title2 guifg=orange

highlight uiki_strong guifg=#FF80FF

let b:current_syntax = 'uiki'
