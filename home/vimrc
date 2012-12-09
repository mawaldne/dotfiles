""""""""""""""""""""""""""""""""""
" Syntax and indent
""""""""""""""""""""""""""""""""""
syntax on " Turn on syntax highligthing
set showmatch  "Show matching bracets when text indicator is over them

colorscheme delek

" Switch on filetype detection and loads 
" indent file (indent.vim) for specific file types
filetype indent on
filetype on
set autoindent " Copy indent from the row above
set si " Smart indent


" I always push F1 by mistake. I dont need to see help
nmap <F1> <nop>

"Color scheme
colorscheme koehler
set guifont=Menlo:h12

"
set nocp

"
set bs=indent,eol,start
"Ignore Case during searches
set ignorecase

"Tabspace
set ts=2

"Shiftwidth
set sw=2

"expandtab - converts tabs to spaces
set et

"
set paste

"
set clipboard=unnamed

syntax on

set number
set ruler
set showcmd
set showmatch
set visualbell
set cmdheight=2
set scrolloff=2
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*
set laststatus=2

set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/tmp

" Show invisible characters
nmap <leader>l :set list!<CR>

" Clears trailing whitespace
map <Leader><Space> :%s/\s\+$//<CR>:let @/=''<CR>

" Use the same symbols as TextMate for tabstops and EOLs
if &encoding == 'utf-8'
  set listchars=tab:▸\ ,eol:¬,trail:·
endif


" make python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
autocmd FileType python set tabstop=4 textwidth=79

" format JSON
map <leader>j  <Esc>:%!python -m json.tool<CR>
