" syntax for uiki
"
if exists('b:current_syntax')
"  finish
endif

runtime! syntax/textile.vim

setlocal conceallevel=2
setlocal concealcursor=nc

syntax match uiki_page_link "\[\[.\{-1,}\]\]" contains=uiki_page_block
syntax match uiki_strong /![^!]\+!/ contains=uiki_strong_bar
syntax match uiki_page_block /\[\[/ contained conceal
syntax match uiki_page_block /\]\]/ contained conceal

syntax match uiki_pre_start /^<pre>.*/
syntax match uiki_pre_end   /.*<\/pre>$/
"syn region uiki_code start='<pre><code\s\+.*>$' end='<\/code><\/pre>'

highlight default link uiki_page_link  Underlined
highlight default link uiki_page_block Statement
highlight default link uiki_link       Underlined
highlight default link uiki_pre        Type
highlight uiki_pre_start  guifg=#696969
highlight uiki_pre_end    guifg=#696969
highlight uiki_hide       guifg=#696969
highlight default link uiki_pre_start uiki_hide
highlight default link uiki_pre_end   uiki_hide

"let b:current_syntax = 'uiki'
