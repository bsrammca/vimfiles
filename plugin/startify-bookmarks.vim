if globpath(&rtp, "autoload/startify.vim") == "" | finish | endif

"
" Bookmark commands
"

function! s:get_bookmark_commands()
  let globs = globpath(stdpath('config').'/bookmarks', '*', 0, 1)
  let dirs = filter(globs, "isdirectory(expand(v:val))")
  let commands = map(dirs, "[ fnamemodify(v:val, ':t'), 'cd ' . resolve(expand(v:val)) . ' | StartifyReset' ]")
  return commands
endfunction

let g:startify_commands = s:get_bookmark_commands()

