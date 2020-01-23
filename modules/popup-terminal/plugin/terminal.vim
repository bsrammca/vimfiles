let g:term_name = 'Quickterm'
let g:term_height = 20

" Open a terminal
command! Term :call <SID>open_terminal()
function! s:open_terminal()
  split
  exe "normal \<C-w>J"
  exec 'resize ' . g:term_height

  try
    exec 'b ' . g:term_name
    norm a
  catch
    term
    exec 'file ' . g:term_name
  endtry
endfunction

au TermClose *Quickterm* bwipe! | close
