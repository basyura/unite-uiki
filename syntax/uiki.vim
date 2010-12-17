" syntax for uiki
"
if exists('b:current_syntax')
  finish
endif

syntax match uiki_page_link "\[\[.*\]\]"
syntax match uiki_link       "\<http://\S\+"  
syntax match uiki_link       "\<https://\S\+"

highlight default link uiki_page_link  Statement
highlight default link uiki_link       Statement


let b:current_syntax = 'uiki'
