" Include guard
if exists('g:autoloaded_gitgrep') || &compatible | finish | endif
let g:autoloaded_gitgrep = 1

" Name of the gitgrep window
if !exists('g:gitgrep_window')
  let g:gitgrep_window = 'GitGrep'
endif

" Position in :VG (right or left)
if !exists('g:gitgrep_vertical_position')
  let g:gitgrep_vertical_position = 'right'
endif

if !exists('g:gitgrep_use_cursor_line')
  let g:gitgrep_use_cursor_line = 1
endif

" Position in :SG (top or bottom)
if !exists('g:gitgrep_horizontal_position')
  let g:gitgrep_horizontal_position = 'bottom'
endif

" Height for the window
if !exists('g:gitgrep_height')
  let g:gitgrep_height = 30
endif

" Store the last known search here
if !exists('g:gitgrep_last_query')
  let g:gitgrep_last_query = ''
endif

" Opens a window for [v]ertical, [s]plit, [t]ab or [max]imised
function gitgrep#open_window(win_mode)
  let mode = a:win_mode == '' ? 'm' : a:win_mode

  " save the referer window for splits
  let referer = winnr()

  if mode == 'v'
    let pos = g:gitgrep_vertical_position == 'right' ? 'botright' : 'topleft'
    exe 'vert ' . pos . ' new'
    let b:referer = referer
  elseif mode == 't'
    tabnew
    let b:referer = referer
  elseif mode == 's'
    let pos = g:gitgrep_horizontal_position == 'bottom' ? 'bot' : 'top'
    exe '' . pos . ' new'
    exe 'resize ' . g:gitgrep_height
    let b:referer = referer
  elseif mode == 'm'
    let pos = g:gitgrep_horizontal_position == 'bottom' ? 'bot' : 'top'
    exe '' . pos . ' new'
    resize
  endif
endfunction

" Opens a window, or focuses if it's already there
" Returns:
"  - `0` if it's a new window
"  - `1` if it's a new window & existing buffer
"  - `2` if it's an existing window & existing buffer
"
function! gitgrep#prepare_window(win_mode)
  let buf = bufnr(g:gitgrep_window)
  let win = bufwinnr(buf)

  if buf == -1
    " New buffer/window
    call gitgrep#open_window(a:win_mode)
    " set buffer name
    exe 'file ' . g:gitgrep_window
    let b:gitgrep_buffer = 1
    call gitgrep#bind_buffer_keys()
    return 0
  elseif win == -1
    " Old buffer, new window (reuse the old buffer)
    call gitgrep#open_window(a:win_mode)
    exe 'b ' . buf
    return 1
  else
    " Old buffer, old window (focus on open window)
    exec '' . win . 'wincmd w'
    return 2
  endif
endfunction

function! gitgrep#run(win_mode, query)
  " What invoked it
  let source = winnr()

  " Get query
  if a:query == ''
    if g:gitgrep_last_query == ''
      echo "What do you want to search for?"
      return
    else
      " Repeat the last query
      let query = g:gitgrep_last_query
    end
  else
    " New query
    let query = a:query
  endif

  " Open and focus on the window
  let window_mode = gitgrep#prepare_window(a:win_mode)
  if window_mode > 0
    if g:gitgrep_last_query == query
      " If it's just refocusing, and the query hasn't changed,
      " don't do anything
      return
    else
      " Otherwise, clear out the entire buffer
      setlocal noreadonly modifiable
      norm ggVG"_d
    endif
  endif

  " Perform an git grep search
  let escaped_query = shellescape(a:query)
  silent! exec 'r!git grep --heading --line-number -E ' . escaped_query
  setlocal filetype=gitgrep buftype=nofile

  " check line count to see if there are results
  if line('$') != 1
    " Highlight currenty query
    let @/ = query

    try
      " Format lines
      silent! %s#^\d\+:#  &  #g

      " Format filenames
      silent! %s#^[^ ]\+$#\r&#g
    catch /./
    endtry

    " Move cursor to top, remove first 2 lines
    normal gg
    normal "_2dd
  else
    exec "normal a!    No results found for `" . query . "`"
  endif

  " Prevent it from being written
  setlocal nomodifiable nonumber
  set hlsearch

  " Finally, let it be picked up later
  let g:gitgrep_last_query = a:query
endfunction

function! gitgrep#bind_buffer_keys()
  if g:gitgrep_use_cursor_line == 1
    setlocal cursorline
  endif

  nnoremap <silent> <buffer> <cr> :call gitgrep#navigate('m')<cr>:<esc>
endfunction

function! gitgrep#navigate(target)
  let old_g = @g

  " only operate on the gitgrep buffer
  if b:gitgrep_buffer != 1
    return
  endif

  " keep track of original cursor location
  normal mg

  " copy the first word. it might be the line number
  normal ^"gyw

  " use it as the line number if it's numeric
  if @g =~? '^\d\+$'
    let linenr = @g
  else
    let linenr = '1'
  endif

  " move to the filename and copy
  normal {
  if line('.') != '1'
    normal j
  endif
  normal "gyy

  " snap back to old location
  normal 'g

  " use the referer window if possible
  let win = exists('b:referer') ? b:referer : winnr()
  let filepath = @g
  exe '' . win . 'windo edit +' . linenr . ' ' . filepath

  " restore old register
  let @g = old_g
endfunction
