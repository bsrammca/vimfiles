if globpath(&rtp, "plugin/easy_align.vim") == ""
  finish
endif

vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
nmap gA <Plug>(EasyAlign)ip
