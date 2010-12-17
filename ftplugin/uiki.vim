" ftplugin for uiki
"
nmap <silent> <buffer> <CR> :call <SID>uiki_link_action()<CR>
"
" 
"
function! s:uiki_link_action()
  let matched = matchlist(expand('<cWORD>') , 'https\?://\S\+')
  if len(matched) != 0
    echohl yarm_ok | execute "OpenBrowser " . matched[0] | echohl None
    return
  endif
  " get syntax id
  let hiid = synIDattr(synID(line('.'),col('.'),1),'name')

  if hiid =~ 'uiki_page_link\|uiki_link'
    echo 'open page'
  else
    execute "normal! \n"
  endif
endfunction
