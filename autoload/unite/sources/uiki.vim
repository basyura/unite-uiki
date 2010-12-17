" uiki source for unite.vim
" Version:     0.0.1
" Last Modified: 17 Dec 2010
" Author:      basyura <basyrua at gmail.com>
" Licence:     The MIT License {{{
"     Permission is hereby granted, free of charge, to any person obtaining a copy
"     of this software and associated documentation files (the "Software"), to deal
"     in the Software without restriction, including without limitation the rights
"     to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
"     copies of the Software, and to permit persons to whom the Software is
"     furnished to do so, subject to the following conditions:
"
"     The above copyright notice and this permission notice shall be included in
"     all copies or substantial portions of the Software.
"
"     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
"     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
"     FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
"     AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
"     LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
"     OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
"     THE SOFTWARE.
" }}}
"
"
" variables
"
"
" source
"
function! unite#sources#uiki#define()
  return s:unite_source
endfunction
" cache
let s:candidates_cache  = []
"
let s:unite_source      = {}
let s:unite_source.name = 'uiki'
let s:unite_source.default_action = {'common' : 'open'}
let s:unite_source.action_table   = {}
" create list
function! s:unite_source.gather_candidates(args, context)
  " cache issues
  let s:candidates_cache = 
        \ map(s:create_sources() , '{
        \ "abbr"          : v:val.abbr ,
        \ "word"          : v:val.word ,
        \ "source"        : "uiki",
        \ "source__uiki"  : v:val
        \ }')
  
  call insert(s:candidates_cache , {
        \ 'abbr'   : '[new page]' ,
        \ 'word'   : 'new' ,
        \ "source" : "uiki",
        \ } , 0)

  return s:candidates_cache
endfunction
"
" action table
"
let s:action_table = {}
let s:unite_source.action_table.common = s:action_table
" 
" action - open
"
let s:action_table.open = {'description' : 'open uiki'}
function! s:action_table.open.func(candidate)
  if a:candidate.word == 'new'
    let page_name = input('input new page name : ')
    if page_name != ""
      execute 'edit! ' . g:unite_uiki_path . '/' . page_name . '.uiki'
    endif
  else
    execute 'edit! ' . a:candidate.source__uiki.path
  endif
  "setfiletype uiki
endfunction
"
" create sources
"
function! s:create_sources()
  let list = []
  for v in split(globpath(g:unite_uiki_path , '*.uiki') , '\n')
    let fname  = fnamemodify(v , ':t:r')
    let source = {
          \ 'abbr' : fname ,
          \ 'word' : fname ,
          \ 'path' : v
          \ }
    call add(list , source)
  endfor
  return list
endfunction

