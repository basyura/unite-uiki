"
" 
"
function! unite#uiki#link_action()
  let matched = matchlist(expand('<cWORD>') , 'https\?://\S\+')
  if len(matched) != 0
    echohl yarm_ok | execute "OpenBrowser " . matched[0] | echohl None
    return
  endif
  " get syntax id
  let hiid = synIDattr(synID(line('.'),col('.'),1),'name')

  if hiid =~ 'uiki_page_link\|uiki_link\|uiki_page_block'
    let matched = matchlist(expand('<cWORD>') , '\[\[\zs.*\ze\]\]')
    if len(matched) != 0
      execute 'edit! ' . matched[0] . '.uiki'
      "setfiletype uiki
    endif
  else
    execute "normal! \n"
  endif
endfunction
