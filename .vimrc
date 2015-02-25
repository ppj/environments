set nocompatible              " choose no compatibility with legacy vi
filetype plugin indent on     " required
syntax enable
set mouse=a                   " allow mouse to set cursor position

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
Plugin 'godlygeek/tabular'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'plasticboy/vim-markdown'
Plugin 'Yggdroot/indentLine'
" SnipMate Plugin
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" All of your Plugins must be added before the following line
call vundle#end()            " required
let g:indentLine_color_term = 236

fun! SetupVAM()
  let c = get(g:, 'vim_addon_manager', {})
  let g:vim_addon_manager = c
  let c.plugin_root_dir = expand('$HOME', 1) . '/.vim/vim-addons'

  " Force your ~/.vim/after directory to be last in &rtp always:
  " let g:vim_addon_manager.rtp_list_hook = 'vam#ForceUsersAfterDirectoriesToBeLast'

  " most used options you may want to use:
  " let c.log_to_buf = 1
  " let c.auto_install = 0
  let &rtp.=(empty(&rtp)?'':',').c.plugin_root_dir.'/vim-addon-manager'
  if !isdirectory(c.plugin_root_dir.'/vim-addon-manager/autoload')
    execute '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '
        \       shellescape(c.plugin_root_dir.'/vim-addon-manager', 1)
  endif

  " This provides the VAMActivate command, you could be passing plugin names, too
  call vam#ActivateAddons([], {})
endfun
call SetupVAM()
ActivateAddons vim-snippets snipmate

set encoding=utf-8
set showcmd           " display incomplete commands
set laststatus=2
set t_Co=256
set cursorline                                      " highlight current line
hi CursorLine cterm=bold ctermbg=235
set number                                          " show line numbers

"" Whitespace
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
noremap <silent><leader>k :bd<CR>
noremap <silent><leader>kf :bd!<CR>

let g:airline#extensions#tabline#enabled=1

" Show NERDTREE automatically on opening vim
" autocmd vimenter * NERDTree
" Map Ctrl+n to open/close NERDREE
map <C-n> :NERDTreeToggle<CR>
" Close vim if only window open is NERDTREE
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

