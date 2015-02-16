set nocompatible              " choose no compatibility with legacy vi
set laststatus=2
set t_Co=256
set clipboard=unnamedplus     " set default register to the system clipboard
filetype off                  " required
 
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"  
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"   
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-fugitive.git'
Plugin 'vim-scripts/ScrollColors'  
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'tomtom/tcomment_vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-haml'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required

let g:airline#extensions#tabline#enabled = 1

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
 
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

" Show NERDTREE automatically on opening vim
" autocmd vimenter * NERDTree
" Map Ctrl+n to open/close NERDREE
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window open is NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
