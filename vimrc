" Leader
let localmapleader=','
let mapleader=','

set autoindent                      " take indent for new line from previous line
set autowrite                       " Automatically :write before running commands
set backspace=eol,start,indent      " allow backspacing over indent, eol, & start
set clipboard=unnamed
set colorcolumn=+1                  " Make it obvious where 80 characters is
set cursorline                      " highlight the screen line of the cursor
set diffopt+=vertical               " Always use vertical diffs
set encoding=utf-8                  " Necessary to show unicode glyphs
set expandtab                       " use spaces when <Tab> is inserted
set gdefault                        " default to /g when substituting
set history=50
set hlsearch                        " highlight matched patterns
set ignorecase                      " ignore case
set incsearch                       " do incremental searching
set laststatus=2                    " Always display the status line
set list
set listchars=tab:»·,trail:·,nbsp:· " whitespace and trailing spaces
set mouse=a                         " allow mouse scrolling
set nobackup
set nowritebackup
set noswapfile                      " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set nowrap                          " Dont wrap text
set number                          " Print the line number in front of each line
set numberwidth=5                   " Columns for line numbers
set ruler                           " Show the cursor position all the time
set scrolloff=3                     " Minimal number of screen lines to keep above and below the cursor
set shiftround                      " Indent not rounded to shiftwidth
set shiftwidth=2                    " Number of spaces to use for (auto)indent step
set showcmd                         " Display incomplete commands
set smartcase                       " Match case if a capital letter is present in the regexp
set smartindent                     " Smart autoindenting for C programs
set smarttab                        " Make <tab> and <backspace> smarter
set softtabstop=2                   " Number of spaces that <Tab> uses while editing
set splitbelow                      " Open new split panes to right and bottom
set splitright                      " Open new split panes to right and bottom
set tabstop=2                       " 1 tab = 2 spaces
set textwidth=80                    " Make it obvious where 80 characters is
set wildmenu                        " show list instead of just completing
set wildmode=list:longest,full      " command <Tab> completion, list matches, then longest common part, then all.

imap <Tab> <C-N>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype plugin indent on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json

  " ALE linting events
  if g:has_async
    set updatetime=1000
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Lint()
    autocmd CursorHoldI * call ale#Lint()
    autocmd InsertEnter * call ale#Lint()
    autocmd InsertLeave * call ale#Lint()
  else
    echoerr "The thoughtbot dotfiles require NeoVim or Vim 8"
  endif
augroup END

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Colors & Visuals
colorscheme mango

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
