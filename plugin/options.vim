" == Options =================================================================

set backspace=indent,eol,start  " Backspacing over insert mode
set history=50                  " keep 50 lines of command line history
set ruler                       " show the cursor position all the time
set showcmd                     " display incomplete commands
set incsearch                   " do incremental searching
set winminheight=0

" == Search ==================================================================

set incsearch                   "is:    automatically begins searching as you type
set ignorecase                  "ic:    ignores case when pattern matching
set smartcase                   "scs:   ignores ignorecase when pattern contains uppercase characters
set hlsearch                    "hls:   highlights search results; ctrl-n or :noh to unhighlight
nmap <silent> <C-N> :silent noh<CR>

" == Programming =============================================================

syntax on                       "syn:   syntax highlighting
set cindent                     "cin:   enables automatic indenting c-style
set cinoptions=l1,j1            "cino:  affects the way cindent reindents lines
set showmatch                   "sm:    flashes matching brackets or parenthasis
set matchtime=3
set listchars=tab:>-,eol:$      "lcs:   makes finding tabs easier during `set list`

" == Tabs ====================================================================

set softtabstop=2
set tabstop=2                   "ts:    number of spaces that a tab counts for
set shiftwidth=2                "sw:    number of spaces to use for autoindent
set smarttab                    "sta:   helps with backspacing because of expandtab
set expandtab                   "et:    uses spaces instead of tab characters

" == Others ==================================================================

set foldmethod=manual           "fdm:   fold by the indentation by default
set nowrap
set mouse=a

" == Macro helpers ===========================================================

set lazyredraw                  "lz:    will not redraw the screen while running macros (goes faster)

" == Backups =================================================================

set nobackup                    " Seriously, in this age of Git, who needs it
set nowritebackup               " Don't make a backup before overwriting
set noswapfile                  " Don't litter swap files everywhere
set directory=/tmp              " Temp directory

" == HUD and status info =====================================================

set number                      "nu:    numbers lines
set numberwidth=5               "nuw:   width of number column
set showmode                    "smd:   shows current vi mode in lower left
set showcmd                     "sc:    shows typed commands
set cmdheight=1                 "ch:    make a little more room for error messages
set scrolloff=4                 "so:    places a couple lines between the current line and the screen edge
set sidescrolloff=2             "siso:  places a couple lines between the current column and the screen edge
set laststatus=2                "ls:    makes the status bar always visible
set ttyfast                     "tf:    improves redrawing for newer computers

" == Menu completion =========================================================

set wildmenu                    "wmnu:  enhanced ed command completion
set wildmode=longest:full,list:full  "wim:   helps wildmenu auto-completion
