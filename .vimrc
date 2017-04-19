" Plugins
call plug#begin()

Plug 'morhetz/gruvbox'  " colour theme
Plug 'rking/ag.vim'     " the silver searcher, fast code search (not indexed)
Plug 'kien/ctrlp.vim'   " fuzzy code search

call plug#end()

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" Ag settings
nnoremap <leader>a :Ag 

" CtrlP settings
"" search results show at bottom, ordered top-to-bottom
let g:ctrlp_match_window = 'bottom,order:ttb'
"" always load into a new buffer
let g:ctrlp_switch_buffer = 0
"" always respect vim directory changes
let g:ctrlp_working_path_mode = 0
"" use the silver searcher for fast code search
let g:ctrlp_user_command = 'ag -l --nocolor -g ".*\.(c|cpp|js|cs|html|rb|py|java|vim)$" %s'

set encoding=utf-8
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 11
set laststatus=2

" Colours
colorscheme gruvbox
set background=dark

" UI
filetype indent on
syntax enable
autocmd FileType c,cpp,js,cs,html,rb,py,java,vim set number     " enable line numbers on common code filetypes
highlight LineNr guibg=#2B2B2B
set cursorline      " highligh current line
set wildmenu        " enable visual menu for line autocomplete
set lazyredraw      " redraw less when it's not necessary
set showmatch       " highlight matching brackets/parents/braces
set guioptions-=m   " disable menubar
set guioptions-=T   " disable toolbar
"set lines=80
"set columns=240
"au VimEnter * set spr|vnew|set nospr|wincmd h   " open an extra empty window on the right when Vim starts
"TODO(mjt): maybe we need a function to do this more robustly for features like gvim -O 1.c 2.c

let mapleader = ","

" Build
set makeprg=./build.sh
"nnoremap <leader>b :update<CR>:make<CR>:cwindow<CR> 
"nnoremap <A-b> :update<CR>:make<CR>:cwindow<CR> 
"inoremap <A-b> <C-o>:update<CR><C-o>:make<CR><C-o>:cwindow<CR>

" Curtesy of @debiatan
" recompile showing errors in a non-obstrusive manner
nnoremap <leader>, :wall<CR>:silent make -s\|cc<CR>zv
nnoremap <leader>< :wall<CR>:silent make -s\|cw<CR>zv
nnoremap <leader>. :cnext<CR>zv
nnoremap <leader>m :cprev<CR>zv
""

" Editing
set backspace=2     " 2 -- backspace over eol, indents and insert-start
set tabstop=4       " tab width for display is 4
set softtabstop=4   " tab width for editing is 4
set shiftwidth=0    " autoindent width to match tabstop
set expandtab       " expand tabs into spaces
set nowrap          " do not line wrap on edge of window
set textwidth=120   " width used to line wrap
set formatoptions+=t    " enabled line wrap on textwidth

"" map save session (restart by source ~/Session.vim or gvim -S ~)
"" -- should probably save this to CWD (remove ~/)
nnoremap <leader>s :mksession ~/Session.vim<CR>

"" map key to save current buffer
inoremap <c-CR><c-CR> <c-o>:update<CR>
nnoremap <c-CR><c-CR> :update<CR>

"" map key to autocomplete
inoremap <c-SPACE> <C-N>
""TODO(mjt): Take a look at neocomplete, since YouCompleteMe doesn't appear
"            to be well supported on Windows

"" remap move between windows splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
inoremap <C-h> <C-o><C-w>h
inoremap <C-j> <C-o><C-w>j
inoremap <C-k> <C-o><C-w>k
inoremap <C-l> <C-o><C-w>l

"" map keys to resize/restore window splits
nnoremap <A-r> :resize<CR>:vertical-resize<CR>:winc=<CR>
inoremap <A-r> <C-o>:resize<CR><C-o>:vertical-resize<CR><C-o>:winc=<CR>
"nnoremap <A-t> :resize 15<CR>
"inoremap <A-t> <C-o>:resize 15<CR>
nnoremap <A-e> :vertical-resize 50<CR>
inoremap <A-e> <C-o>:vertical-resize 50<CR>
nnoremap <A-w> :vertical resize<CR>:resize<CR>
"map key to close all but current window
nnoremap <A-o> <C-w>o
inoremap <A-o> <C-o><C-w>o

"Open in other split (if exists)
inoremap <A-Right> <C-o><C-W>w<C-o>:edit 
nnoremap <A-Right> <C-W>w:edit
"Open in right split (if exists)
inoremap <A-Right> <C-o><C-W>l<C-o>:edit 
nnoremap <A-Right> <C-W>l:edit 
"Open in left split (if exists)
inoremap <A-Left> <C-o><C-W>h<C-o>:edit 
nnoremap <A-Left> <C-W>h:edit 
