if globpath(&rtp, "autoload/startify.vim") == "" | finish | endif

"
" Set banner
"

command! StartifySetBanner :call <SID>set_banner()

function! s:set_banner()
  let project_dir = fnamemodify(getcwd(), ':t')
  if has('nvim')
    let version_line = 'Neovim'
  else
    let version_line = 'Vim'.v:version
  endif

  if executable('toilet')
    let g:startify_custom_header =
      \ [ '' ] +
      \ startify#pad([version_line]) +
      \ startify#pad(split(system('echo '.project_dir.' | toilet -f future'), '\n')) +
      \ [ '' ]
  else
    let g:startify_custom_header =
      \ [ '', '', '', startify#center(project_dir), startify#pad([version_line]), '', '', '' ]
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

StartifySetBanner
