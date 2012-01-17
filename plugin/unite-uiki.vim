
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
  "call s:apply_code_syntax()
endfunction

" from hatena.vim
function! s:apply_code_syntax()
  let g:main_syntax = 'textile'
  if !exists('b:applied_syntax')
    let b:applied_syntax = {}
   " autocmd BufEnter <buffer> call s:apply_code_syntax()
    autocmd BufWritePost <buffer> call s:apply_code_syntax()
  endif
  let lnum = 1
  let lmax = line("$")
  let mx   = '<code\s\+class="\zs.*\ze">$'
  while lnum <= lmax
    let curline = getline(lnum)
    if curline =~ mx
      let lang = matchstr(curline, mx)
      if len(lang) && !has_key(b:applied_syntax, lang)
        exec 'runtime! syntax/'.lang.'.vim'
        unlet b:current_syntax
        let syntaxfile = fnameescape(substitute(globpath(&rtp, 'syntax/'.lang.'.vim'), '[\r\n].*$', '', ''))
        if len(syntaxfile)
          let b:applied_syntax[lang] = syntaxfile
          exec 'syntax include @inline_' . lang . ' ' . syntaxfile
          exec 'syntax region uiki_code matchgroup=uiki_hide start=+<code\s\+class="'.lang.'">+ end=+<\/code>+ contains=@inline_' . lang
        endif
      endif
    end
    let lnum = lnum + 1
  endwhile
  " redefine syntax that changed by xml syntax
  syntax clear uiki_pre_start
  syntax clear uiki_pre_end
  syntax match uiki_pre_start /^<pre>/
  syntax match uiki_pre_end   /<\/pre>$/
  unlet g:main_syntax
endfunction

let g:loaded_unite_uiki = 1
