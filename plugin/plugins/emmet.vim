if globpath(&rtp, "plugin/emmet.vim") == ""
  finish
endif

imap <C-e> <C-y>,
vmap <C-e> <C-y>,