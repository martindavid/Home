set nocompatible
syntax enable
filetype plugin indent on
set clipboard=unnamed
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'jelera/vim-javascript-syntax'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'neovimhaskell/haskell-vim'
Plugin 'ervandew/supertab'
Plugin 'eagletmt/neco-ghc'
Plugin 'vim-airline/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'nbouscal/vim-stylish-haskell'
Plugin 'mattn/emmet-vim'
call vundle#end()

set nobackup
set noswapfile

colorscheme gruvbox
set background=dark

" SPACE AND TABS
set tabstop=2		" number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab		" tabs are spaces
set shiftwidth=2
set shiftround

" UI CONFIG
set nu		          " show line number
set showcmd		      " show command in bottom bar
set cursorline		  " highlight current line
filetype indent on	" load filetype-specific indent files
set wildmenu		    " visual autocomplete for command menu
set lazyredraw		  " redraw only when need to
set showmatch		    " highlight matching [{()}]
set hlsearch        " highlight search terms
set splitbelow      " Horizontal splits open below current file
set splitright      " Vertical splits open to the right of the current file

set backspace=indent,eol,start

" FOLDING
set foldlevelstart=10
set foldnestmax=10
set foldmethod=indent
set foldlevel=99

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


" Enable folding with the spacebar
nnoremap <space> za

set encoding=utf-8

let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview
let python_highlight_all=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree"

map <F2> :NERDTreeToggle<CR>

map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Custom ignore for ctrl-p
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" Ignore html in syntastic since it doesn't handle handlebars
let syntastic_mode_map = { 'passive_filetypes': ['html'] }

" Don't require saving a buffer before switching buffers
set hidden

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

nmap <leader>1 :set lines=40 columns=85<CR><C-w>o
nmap <leader>2 :set lines=50 columns=171<CR><C-w>v

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
