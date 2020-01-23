let g:mapleader=","
if has('nvim')
  let vim = stdpath('config')
else
  let vim = $HOME . '/.vim'
end

call plug#begin(vim . '/vendor')

" Home-made modules
Plug vim . '/modules/dynamic-theme'
Plug vim . '/modules/save-typos'
Plug vim . '/modules/ctrl-c-ctrl-v'
Plug vim . '/modules/git-grep'
Plug vim . '/modules/popup-terminal'

" Core plugins
Plug 'rstacruz/vim-opinion'

" Don't load the other plugins
if $GIT_AUTHOR_DATE != '' || $VIM_MINIMAL != ''
  call plug#end()
  finish
endif

Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'junegunn/vim-easy-align'
Plug 'mhinz/vim-startify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'thinca/vim-visualstar'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

let g:coc_global_extensions = [ 'coc-tsserver', 'coc-prettier', 'coc-json', 'coc-snippets', 'coc-solargraph' ]

call plug#end()
