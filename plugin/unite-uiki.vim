
if exists('g:loaded_unite_uiki')
  finish
endif

augroup uiki-group
  autocmd!
  autocmd BufNewFile,BufRead *.uiki call <SID>unite_uiki_settings()
augroup END

function! s:unite_uiki_settings()
  setlocal filetype=uiki
  nmap <silent> <buffer> <CR> :call unite#uiki#link_action()<CR>
endfunction

let g:loaded_unite_uiki = 1
