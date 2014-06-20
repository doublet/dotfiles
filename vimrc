set nocompatible	" be vim
filetype off		" required for vundle

set expandtab
set shiftwidth=2
set softtabstop=2


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins go here
Plugin 'bling/vim-airline'
Bundle 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2

""""""""""""""""""""""""
" airline
""""""""""""""""""""""""
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1

let g:airline_powerline_fonts   = 1

syntax on