execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set ruler
set mouse=a
set clipboard=unnamed
set modifiable
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set wrap
set linebreak
set nolist 
set textwidth=0
set wrapmargin=0
let g:jsx_ext_required = 0
set tabstop=2
set shiftwidth=2
set expandtab
set runtimepath^=~/.vim/bundle/ctrlp.vim
set nocompatible
:set incsearch
:set ignorecase
:set smartcase
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
filetype plugin on

let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_working_path_mode = ''

let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
map <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>tb :Tabularize<Space>
highlight IncSearch ctermfg=Red guifg=Red
