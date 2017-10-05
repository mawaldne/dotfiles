" Additional configs and scripts are in .vim/plugins folder

autocmd!

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin('~/.vim/plugged')

Plug 'dracula/vim'
"Plug 'tomasr/molokai'
Plug 'ctrlpvim/ctrlp.vim'

if has('nvim')
    Plug 'SirVer/ultisnips'
endif

Plug 'https://github.com/mawaldne/BufOnly.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary', { 'on': '<Plug>Commentary' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-eunuch'
Plug 'justinmk/vim-dirvish'
"Plug 'scrooloose/nerdtree'
"Plug 'scrooloose/syntastic'

" Ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails',      { 'for': []      }

" Rust
Plug 'rust-lang/rust.vim'

" Scala
Plug 'https://github.com/derekwyatt/vim-scala'

" Elm
Plug 'lambdatoast/elm.vim'

" Elixir
Plug 'elixir-lang/vim-elixir'

" JS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-json'

" HTML CSS
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] }

" Devops
Plug 'https://github.com/hashivim/vim-terraform'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:molokai_original = 1
"colorscheme molokai

color dracula

" Set 256 colors
set t_Co=256

" In 10 years of using vim, a swap file has never saved me. They only annoyed me.
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number
set nocompatible

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" remember more commands and search history
set history=10000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch
set hlsearch

" Natural split changes
set splitbelow                              " Splitting a window will put the new window below the current
set splitright

" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase

set cmdheight=1
set switchbuf=useopen
set showtabline=1
set winwidth=79

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" Don't make backups at all
set nobackup
set nowritebackup

set backspace=indent,eol,start

" display incomplete commands
set showcmd

" Enable highlighting for syntax
syntax on

" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on

" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list

" make tab completion for files/buffers act like bash
set wildmenu

" Fix slow O inserts
set timeout timeoutlen=1000 ttimeoutlen=100

" Normally, Vim messes with iskeyword when you open a shell file. This can
" leak out, polluting other file types even after a 'set ft=' change. This
" variable prevents the iskeyword change so it can't hurt anyone.
let g:sh_noisk=1

" Modelines (comments that set vim options on a per-file basis)
set modeline
set modelines=3

" Turn folding off for real, hopefully
set foldmethod=manual
set nofoldenable

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread

set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

" Space works better on my kenesis keyboard. Kenesis for life!
let mapleader = "\<Space>"

" Copy everything to the system clipboard
set clipboard=unnamed

" NVIM Only feature - show a %s change as you write it in the file
if has('nvim')"
  set inccommand=split
endif

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  *<CR>:set nopaste<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo folder. undo changes after closing and opening files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile
set undodir=~/.vim/undodir

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC KEY MAPS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Repeat last ex command using F2
map <F2> @:

" Repeat last macro using F3
map <F3> @@

" Show invisible characters
nmap <leader>i :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
if &encoding == 'utf-8'
    set listchars=tab:▸\ ,eol:¬,trail:·
endif

" Pretty print a json file
command! -nargs=0 Jqfile %!jq '.'

" Turn off highlighting
nnoremap <leader>\ :noh<return> " Turn off highlighting

" Turn off ex mode.
map q: <Nop>
nnoremap Q <Nop>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>w :bp <BAR> bd #<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Opens an edit command with the path of the currently edited file filled in
" Normal mode: <Leader>e
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" Opens a vertical split command with the path of the currently edited file filled in
" Normal mode: <Leader>t
map <Leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for ruby, autoindent with two spaces, always expand tabs
autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,scss,cucumber,terraform set ai sw=2 sts=2 et

" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set sw=4 sts=4 et

" Dirvish
let loaded_netrwPlugin = 1
command! Explore :Dirvish %:p:h

" Rustfmt on save
let g:rustfmt_autosave = 1
