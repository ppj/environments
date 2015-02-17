set nocompatible              " choose no compatibility with legacy vi
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
   
" The following are examples of different formats supported.
" MISSING

" Keep Plugin commands between vundle#begin/end.
Plugin 'vim-scripts/ScrollColors'
Plugin 'tpope/vim-fugitive.git'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable

set encoding=utf-8
set showcmd           " display incomplete commands
set laststatus=2
set t_Co=256
set cursorline        " highlight current line
set number            " show line numbers

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Ctrl-x to cut in + buffer from visual mode
vnoremap <C-x> "+x
" Ctrl-c to copy in + buffer from visual mode
vnoremap <C-c> "+y
" Ctrl-v to paste from the + register in cmd mode
noremap <C-v> "+p
" Ctrl-v to paste from the + register while editing
inoremap <C-v> <esc>"+p<CR>i
" Ctrl-a to select all & copy in + buffer
noremap  <C-a> :%y+"<CR>
inoremap <C-a> <esc>:%y+"<CR>i
" Select text with shift+arrows in insert mode
set guioptions+=a keymodel=startsel,stopsel 
" Delete trailing white space(s) before saving buffer
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

let mapleader=','
noremap <silent><leader>n :bn!<CR>
noremap <silent><leader>p :bp!<CR>
noremap <silent><leader>k :bd!<CR>

let g:airline#extensions#tabline#enabled=1

" Show NERDTREE automatically on opening vim
" autocmd vimenter * NERDTree
" Map Ctrl+n to open/close NERDREE
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window open is NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

