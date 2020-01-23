if globpath(&rtp, "autoload/startify.vim") == "" | finish | endif

"
" Set banner
"

command! StartifySetBanner :call <SID>set_banner()

function! s:get_vim_version()
  redir => test
    silent version
  redir END

  let lines = split(test, '\n')
  return lines[0]
endfunction

function! s:set_banner()
  let project_dir = fnamemodify(getcwd(), ':t')

  if executable('toilet')
    let g:startify_custom_header =
      \ [ '' ] +
      \ startify#pad(split(system('echo '.project_dir.' | toilet -f future'), '\n')) +
      \ [ '' ]
  else
    let g:startify_custom_header =
      \ [ '', '', '', startify#center(project_dir), '', '', '' ]
  endif
endfunction

"
" Reset
"

command! StartifyReset :call <SID>reset()

function! s:reset()
  Gcd
  call <SID>set_banner()
  SClose
endfunction

let g:startify_custom_footer =
  \ startify#pad([s:get_vim_version()])

StartifySetBanner
