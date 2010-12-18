" syntax for uiki
"
if exists('b:current_syntax')
  finish
endif

syntax match uiki_page_link "\[\[.*\]\]"
syntax match uiki_link       "\<http://\S\+"  
syntax match uiki_link       "\<https://\S\+"

syntax match uiki_title1  "^\* .*"
syntax match uiki_title2  "\s\* .*"

syntax match uiki_strong /|[^|]\+|/ contains=uiki_strong_bar
syntax match uiki_strong_bar /|/ contained

highlight default link uiki_page_link  Statement
highlight default link uiki_link       Statement
highlight uiki_title1  guifg=orange  gui=underline
highlight uiki_title2  guifg=orange

highlight uiki_strong guifg=#FF80FF
highlight link uiki_strong_bar Ignore

let b:current_syntax = 'uiki'
