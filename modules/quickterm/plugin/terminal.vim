let g:quickterm_name = 'Quickterm'
let g:quickterm_height = 20

" Open a terminal in a split window
command! Quickterm :call <SID>open_terminal()
function! s:open_terminal()
  " see if there's already an open buffer
  let buf = bufnr(g:quickterm_name)

  if buf == -1
    call s:open_split_window()
    " Open a terminal
    term
    " Rename the buffer
    exec 'file ' . g:quickterm_name
  else
    let win = bufwinnr(buf)
    if win == -1
      " Buffer is alive, but window is not open
      call s:open_split_window()
      exec 'b ' . g:quickterm_name
      norm a
    else
      " Window is open Focus on the open window
      exec '' . win . 'wincmd w'
      norm a
    endif
  endif
endfunction

" Opens a split window
function! s:open_split_window()
  split
  exe "normal \<C-w>J"
  exec 'resize ' . g:quickterm_height
endfunction

au TermClose *Quickterm* bwipe!
