" ftplugin for uiki
if exists("b:current_ftplugin")
  finish
endif
"
nmap <silent> <buffer> <CR> :call unite#uiki#link_action()<CR>
"nmap <silent><buffer> <CR> <Plug>(uiki_link_action)
"command! -buffer UikiLinkAction() call vimwiki#follow_link('vsplit')
"nmap <silent><buffer> <Plug>(uiki_link_action) <SID>uiki_link_action()


let b:current_ftplugin = 'uiki'
