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

highlight default link uiki_page_link  Statement
highlight default link uiki_link       Statement
highlight uiki_title1  guifg=orange  gui=underline
highlight uiki_title2  guifg=orange


let b:current_syntax = 'uiki'
