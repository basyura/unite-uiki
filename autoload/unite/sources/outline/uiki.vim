"=============================================================================
" File    : autoload/unite/sources/outline/redmine.vim
" Author  : basyura <basyrua@gmail.com>
" Updated : 2011-01-31
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

" Default outline info for redmine(unite-yarm)
" Version: 0.0.1

function! unite#sources#outline#uiki#outline_info()
  return s:outline_info
endfunction

"unite outline

if !exists('g:unite_source_outline_info')
  let g:unite_source_outline_info = {}
endif

let s:outline_info = {
      \ 'heading': '^\*.*' , 
      \}

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  let word  = matchstr(a:heading_line , '^\*\zs.*\ze')
  let heading = {
        \ 'word' : word
        \ }
  return heading
endfunction

" vim: filetype=vim
