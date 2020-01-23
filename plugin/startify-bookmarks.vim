if globpath(&rtp, "autoload/startify.vim") == "" | finish | endif

"
" Bookmark commands
"

function! s:get_bookmark_commands()
  if has('nvim')
    let vim_path = stdpath('config')
  else
    let vim_path = $HOME . '/.vim'
  endif

  let bookmarks_path = vim_path . '/bookmarks'

  let globs = globpath(bookmarks_path, '*', 0, 1)
  let dirs = filter(globs, "isdirectory(expand(v:val))")
  let commands = map(dirs, "[ fnamemodify(v:val, ':t'), 'cd ' . resolve(expand(v:val)) . ' | StartifyReset' ]")
  return commands
endfunction

let g:startify_commands = s:get_bookmark_commands()

