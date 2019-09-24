filetype plugin indent on
syntax on
set nocompatible
syntax on
set number
set encoding=utf8
set noshowmode
set scrolloff=5 "keep 5 lines on screen when scrolling/moving
set wildmenu
set termguicolors
set lazyredraw 
filetype on
filetype plugin on
filetype indent on


call plug#begin('~/.local/share/nvim/plugged')

Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

call plug#end()

" Use deoplete for completion
let g:deoplete#enable_at_startup = 1


""" LaTeX
" Use deoplete for completion with vimtex
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
\})
	" Use omni-completion with vimtex (enabled by default)
	"let g:vimtex_complete_enabled = 1
" Clean compililation files for LaTeX on exit
autocmd FileType tex autocmd VimLeave * :VimtexClean

""" Python3
autocmd CompleteDone * pclose
set splitright
" Python3 macro
autocmd FileType python noremap <F4> :w<Enter>:!python3 %<Enter>

""" Java
" compile current file
autocmd FileType java noremap <F3> :w<Enter>:!javac %<Enter>
" compile everything in the current directory
autocmd FileType java noremap <F4> :w<Enter>:!javac *.java<Enter>
" run the current file's main
autocmd FileType java noremap <F5> :!java %:r<Enter>
" run the directory's Main class
autocmd FileType java noremap <F6> :!java Main<Enter>
" Inset the main method in java
autocmd FileType java noremap <F7> ipublic static void main(String[] args) {<CR><CR>}<ESC>kA

