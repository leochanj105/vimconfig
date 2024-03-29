call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf' | Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'Nopik/vim-nerdtree-direnter'
call plug#end()

"Disable compatibility with vi which can cause unexpected issues.
set nocompatible

set fileformat=unix
set encoding=UTF-8




set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
" call vundle#end()            " required
filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
" set cursorline
"
" " Highlight cursor line underneath the cursor vertically.
" set cursorcolumn

" Set shift width to 4 spaces.
set shiftwidth=2

" Set tab width to 4 columns.
set tabstop=2

set softtabstop=2
set autoindent
set smartindent
set smarttab
set expandtab
set nowrap
set list
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<
"set cursorline
"set relativenumber

set showcmd
set noshowmode
set conceallevel=1


set noerrorbells visualbell t_vb=

set nobackup
set undodir=~/.vim/undodir
set undofile
set clipboard=unnamed

set scrolloff=8
"set signcolumn=yes

" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters
" as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch
set incsearch
nnoremap <CR> :noh<CR><CR>:<backspace>

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set mouse=a

if !has('gui_running') && &term =~ '\%(screen\|tmux\)'
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
let g:gruvbox_italic=0
colorscheme gruvbox
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921',
    \ '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
    \]

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-l> :tabn<CR>
nnoremap <C-j> :tabp<CR>
nnoremap <C-n> :tabnew<CR>
"nnoremap <C-S-q> :tabclose<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
let g:NERDTreeFileLines = 1
set wildignore+=*.DS_Store,*.min.*
let NERDTreeMapOpenInTab='<ENTER>'
autocmd BufWinEnter * silent NERDTreeMirror
" Start on Entry
autocmd VimEnter * NERDTree | wincmd p
" Exit Vim if NERDTree is the only window remaining.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['hidden,right,50%,<70(up,40%)', 'ctrl-/']
"let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout = { 'down': '~20%' }
nnoremap <silent> <C-f> :Files<CR>
let g:fzf_action = { 'enter': 'tab split' }

inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
else
    inoremap <silent><expr> <c-@> coc#refresh()
endif
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        call feedkeys('K', 'in')
    endif
endfunction

