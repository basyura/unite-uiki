"=============================================================================
"
" outline for textile
"
" Licensed under the MIT license:
" http://www.opensource.org/licenses/mit-license.php
"
"=============================================================================

function! unite#sources#outline#uiki#outline_info()
  return s:outline_info
endfunction

"-----------------------------------------------------------------------------
" Outline Info

let s:outline_info = {
      \ 'heading'  : '^h\d',
      \ }

function! s:outline_info.create_heading(which, heading_line, matched_line, context)
  return {
        \ 'word'  : substitute(a:heading_line, 'h\d\{0,}\.\s\+', '', '') ,
        \ 'level' : matchstr(a:heading_line, '^h\zs\d\{0,}\ze') ,
        \ }
endfunction

" vim: filetype=vim
