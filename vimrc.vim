set t_Co=256
set nocompatible
let g:mapleader=","
syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-sensible'

" Themes
Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
Plug 'spf13/vim-colors'
Plug 'whatyouhide/vim-gotham'

if $VIM_MINIMAL == ''
  " Slow plugins
  Plug 'scrooloose/nerdtree'
  Plug 'bling/vim-airline'
  Plug 'SirVer/ultisnips'
  Plug 'rstacruz/vim-ultisnips-css'

  " Unite
  Plug 'Shougo/unite.vim'
  Plug 'tsukkee/unite-tag'
  Plug 'tacroe/unite-mark'
  Plug 'Shougo/unite-outline'

  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-abolish'
  Plug 'craigemery/vim-autotag'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'michaeljsmith/vim-indent-object'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-sensible'
  Plug 'mhinz/vim-signify'
  Plug 'honza/vim-snippets'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-vinegar'
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'sjl/vitality.vim'
  Plug 'tpope/vim-pathogen'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'scrooloose/syntastic'
  Plug 'rstacruz/sparkup', { 'rtp': 'vim' }
  Plug 'rstacruz/vim-opinion'
  Plug 'junegunn/vim-easy-align'
  Plug 'whatyouhide/vim-lengthmatters'
  Plug 'tpope/vim-dispatch'
  Plug 'thinca/vim-visualstar'
  Plug 'bling/vim-bufferline'
  Plug 'mileszs/ack.vim'
  Plug 'junegunn/goyo.vim'
  Plug 'junegunn/vim-xmark', { 'do': 'make' }
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-repeat'

  " Not working well with nvim
  if !has('nvim')
  Plug 'markwu/ZoomWin'
  endif

  " Language specific
  Plug 'wavded/vim-stylus', { 'for': 'stylus' }
  Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
  Plug 'tpope/vim-rails'
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'sass', 'scss', 'less'] }
  Plug 'groenewege/vim-less', { 'for': 'less' }
  Plug 'rstacruz/ledgerdown', { 'rtp': 'vim' }
  Plug 'kchmck/vim-coffee-script', { 'for': ['coffee', 'coffeescript'] }
  Plug 'tpope/vim-haml'
  Plug 'ledger/vim-ledger'
  Plug 'moll/vim-node'

  " Disabled
  " Plug 'mitee/vim-gf-python'
  " Plug 'editorconfig/editorconfig-vim' - use sleuth.vim
  " Plug 'plasticboy/vim-markdown' - not even working
  " (https://github.com/plasticboy/vim-markdown/issues/194)
  " mmai/vim-markdown-wiki 
endif
call plug#end()
