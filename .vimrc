" --- Enable Vundle in vim
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" --- Plugins (Close Plugin list with last two commands)
	Plugin 'vim-scripts/indentpython.vim'
	Plugin 'vim-syntastic/syntastic'
	Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}	
	Plugin 'Valloric/YouCompleteMe'
	Plugin 'scrooloose/nerdtree'
	Plugin 'jistr/vim-nerdtree-tabs'
	Plugin 'morhetz/gruvbox'	
	Plugin 'nvie/vim-flake8'
	Plugin 'tell-k/vim-autopep8'
	Plugin 'junegunn/goyo.vim'
	Plugin 'xuhdev/vim-latex-live-preview'
	" (All of your Plugins must be added before the following line)
		call vundle#end()            " required
		filetype plugin indent on    " required

" --- Virtualenv support
"python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" --- UTF8 support
	set encoding=utf-8

" --- Flagging unneccessary whitespace
"	au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" --- Autocomplete with extra options
	let g:ycm_autoclose_preview_window_after_completion=1"
	map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
	let g:ycm_server_python_interpreter='/usr/bin/python3'
	if !exists('g:ycm_semantic_triggers')
		let g:ycm_semantic_triggers = {}
	endif
	let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme


" --- Syntax Highlighting
	let python_highlight_all=1
	syntax on

" --- Coloscheme commands (Comment one)
	colorscheme gruvbox	
	let g:gruvbox_italic=1
	let g:gruvbox_contrast_dark="soft"
	set background=dark
		
" --- Set Line numbering
	set nu

" --- Hiding .pyc files in NERDTree
	let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" --- Toggle NERDTree
	map <silent> <C-n> :NERDTreeToggle<CR>
	
" --- Configuring nests
	set splitbelow
	set splitright		
	
	"split navigations
	nnoremap <C-J> <C-W><C-J>
	nnoremap <C-K> <C-W><C-K>
	nnoremap <C-L> <C-W><C-L>
	nnoremap <C-H> <C-W><C-H>
" --- Custom keybinds	
	autocmd FileType python nnoremap <buffer> <F8> :call Autopep8()<CR> 
	nmap <F3> :w! <CR>
	nmap <F4> :wq! <CR>
	nmap <F5> :w !python3 <CR>

" --- AutoPEP8 settings
	let g:autopep8_ignore="E501,W293"
	let g:autopep8_select="E501,W293"
	let g:autopep8_pep8_passes=100
	let g:autopep8_max_line_length=79
	
" --- Powerline showing in single window (0,1,2)
	set laststatus=2

" --- Live LaTeX Previewer
	autocmd Filetype tex setl updatetime=1
	let g:livepreview_previewer = 'zathura'
	let g:livepreview_engine = 'xelatex'
	let g:livepreview_cursorhold_recompile = 0
	nmap <F7> :LLPStartPreview<CR>

" --- Goyo!
	nmap <F2> :Goyo <CR>


