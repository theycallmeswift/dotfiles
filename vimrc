set nocompatible

source $HOME/.vim/vundle.vim

syntax enable
filetype plugin indent on

" History & Backup
set nobackup
set nowritebackup
set history=50

" Clipboard
set clipboard=unnamed

" Search
set ignorecase " ignore case
set smartcase  " match case if a capital letter is present in the regexp
set hlsearch   " highlight matched patterns
set incsearch  " highlight search result as you type it

" Colors & Visuals
set t_Co=256
set background=dark
colorscheme mango
set cursorline
set number
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set autoindent smartindent      " turn on auto/smart indenting
set smarttab                    " make <tab> and <backspace> smarter
set tabstop=2                   " tabstops of 2
set softtabstop=2               " let backspace delete indent
set shiftwidth=2                " indents of 2
set expandtab
set backspace=eol,start,indent  " allow backspacing over indent, eol, & start
set gdefault
set shiftround
set nowrap
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set scrolloff=3

" Numbers
set number
set numberwidth=5

" Words
set gdefault
set shiftround
set nowrap

" Misc
let mapleader=','
let localmapleader=','
set pastetoggle=<F12>           " pastetoggle (sane indentation on pastes)
set complete=.,w,b,u,U,t,i,d    " do lots of scanning on tab completion
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.
set list!
set listchars=tab:▸\ ,trail:·,extends:»,precedes:« " whitespace and trailing spaces

set directory=/tmp
set mouse=a " allow mouse scrolling

autocmd Filetype markdown setlocal textwidth=80 " Markdown files should only have 70 character lines

"" Source external vim config files

if filereadable(expand("custom.vim"))
  source custom.vim
endif

source $HOME/.vim/gui.vim
source $HOME/.vim/tab_completion.vim
source $HOME/.vim/autocmd.vim
