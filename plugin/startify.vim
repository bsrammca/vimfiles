if globpath(&rtp, "autoload/startify.vim") == ""
  finish
endif

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

let g:startify_lists = [
  \ { 'type': 'dir',       'header': ['   Recent files'] },
  \ { 'type': 'sessions',  'header': ['   Saved sessions'] },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks'] },
  \ ]

command! StartifyReset :call <SID>reset()

function! s:reset()
  Gcd
  call <SID>set_banner()
  SClose
endfunction

StartifySetBanner

if findfile(stdpath('config').'/local/bookmarks.vim') != ''
  exec 'source '.stdpath('config').'/local/bookmarks.vim'
endif

let g:startify_change_to_vcs_root = 1

autocmd User Startified setlocal cursorline
