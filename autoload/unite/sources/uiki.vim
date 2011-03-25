" uiki source for unite.vim
" Version:     0.0.1
" Last Modified: 25 Mar 2011
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
" let g:unite_uiki_path = '/tmp'
"
" source
"
function! unite#sources#uiki#define()
  return s:unite_source
endfunction
"
let s:unite_source = {
      \ 'name'           : 'uiki' ,
      \ 'description'    : 'candidates from uiki(wiki) pages' ,
      \ 'default_action' : {'common' : 'open'} ,
      \ 'action_table'   : {'common' : {}}
      \ }
" create list
function! s:unite_source.gather_candidates(args, context)
  return map(s:find_pages() , '{
        \ "abbr"         : v:val.name ,
        \ "word"         : v:val.name ,
        \ "source"       : "uiki",
        \ "source__path" : v:val.path ,
        \ }')
endfunction
" new page
function! s:unite_source.change_candidates(args, context)
  let page = substitute(a:context.input, '\*', '', 'g')
  let path = expand(g:unite_uiki_path . '/' . page . '.uiki' , ':p')
  if page != '' && !filereadable(path)
    return [{
          \ 'abbr'         : '[new page] ' . page ,
          \ 'word'         : page   ,
          \ "source"       : "uiki" ,
          \ "source__path" : path   ,
          \ }]
  else
    return []
  endif
endfunction
" 
" action - open
"
let s:unite_source.action_table.common.open = {'description' : 'open uiki'}
function! s:unite_source.action_table.common.open.func(candidate)
  execute 'edit! ' . a:candidate.source__path
endfunction
"
" - private functions -
"
"
" find pages
"
function! s:find_pages()
  return map(split(globpath(g:unite_uiki_path , '*.uiki') , '\n') , '{
          \ "name" : fnamemodify(v:val , ":t:r") ,
          \ "path" : v:val
          \ }')
endfunction

