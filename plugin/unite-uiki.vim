
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
  call s:apply_code_syntax()
endfunction

" from hatena.vim
function! s:apply_code_syntax()
  let g:main_syntax = 'textile'
  if !exists('b:apply_code_sytanx')
    let b:apply_langs = {}
    autocmd BufEnter <buffer> call s:apply_code_syntax()
    autocmd BufWritePost <buffer> call s:apply_code_syntax()
  endif
  let lnum = 1
  let lmax = line("$")
  let mx   = '<code\s\+class="\zs.*\ze">$'
  while lnum <= lmax
    let curline = getline(lnum)
    if curline =~ mx
      let lang = matchstr(curline, mx)
      if len(lang) && !has_key(b:apply_langs, lang)
        exec 'runtime! syntax/'.lang.'.vim'
        unlet b:current_syntax
        let syntaxfile = fnameescape(substitute(globpath(&rtp, 'syntax/'.lang.'.vim'), '[\r\n].*$', '', ''))
        if len(syntaxfile)
          let b:apply_langs[lang] = syntaxfile
          exec 'syntax include @inline_' . lang . ' ' . syntaxfile
          exec 'syntax region uiki_code matchgroup=uiki_hide start=+<code\s\+class="'.lang.'">+ end=+<\/code>+ contains=@inline_' . lang
        endif
      endif
    end
    let lnum = lnum + 1
  endwhile
  " redefine syntax that changed by xml syntax
  syntax match uiki_pre_start /^<pre>/
  syntax match uiki_pre_end   /<\/pre>$/
  unlet g:main_syntax
endfunction

let g:loaded_unite_uiki = 1
