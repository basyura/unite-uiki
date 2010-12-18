" syntax for uiki
"
if exists('b:current_syntax')
  finish
endif

setlocal conceallevel=3
setlocal concealcursor=nc

syntax match uiki_page_link "\[\[.*\]\]" contains=uiki_page_block
syntax match uiki_strong /|[^|]\+|/ contains=uiki_strong_bar
syntax conceal on
syntax match uiki_page_block /\[\[/ contained
syntax match uiki_page_block /\]\]/ contained
syntax match uiki_strong_bar /|/ contained
syntax conceal off

syntax match uiki_link       "\<http://\S\+"  
syntax match uiki_link       "\<https://\S\+"

syntax match uiki_title1  "^\* .*"
syntax match uiki_title2  "\s\* .*"


highlight default link uiki_page_link  Statement
highlight default link uiki_link       Statement
highlight uiki_title1  guifg=orange  gui=underline
highlight uiki_title2  guifg=orange

highlight uiki_strong guifg=#FF80FF

let b:current_syntax = 'uiki'
