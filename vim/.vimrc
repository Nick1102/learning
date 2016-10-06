execute pathogen#infect()
syntax on
filetype plugin indent on
set number
set ruler
autocmd vimenter * NERDTree
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
set tabstop=4
set shiftwidth=4
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
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
nnoremap <Leader>a :Ack!<Space>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
