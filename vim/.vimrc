" Install vim plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Basics
Plug 'tpope/vim-sensible'
Plug 'matze/vim-move'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'sickill/vim-pasta'
Plug 'christoomey/vim-tmux-navigator'

"Niceties
Plug 'tmhedberg/matchit'
Plug 'easymotion/vim-easymotion'
Plug 'simnalamburt/vim-mundo'
Plug 'jiangmiao/auto-pairs'
Plug 'mileszs/ack.vim'
Plug 'slashmili/alchemist.vim'
Plug 'mileszs/ack.vim'

" Color
"Plug 'tomasr/molokai'
Plug 'dikiaap/minimalist'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'KeitaNakamura/neodark.vim'

"Statusline
Plug 'vim-airline/vim-airline'

" language or filetype specific
Plug 'vim-ruby/vim-ruby',          { 'for': ['ruby', 'eruby'] }
Plug 'tpope/vim-rails',            { 'for': ['ruby', 'eruby'] }
Plug 'nelstrom/vim-markdown-folding',{ 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': ['csv', 'xls', 'xlsx'] }
Plug 'tpope/vim-markdown'
Plug 'elixir-lang/vim-elixir'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-endwise'
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'
Plug 'posva/vim-vue'

" Fuzzy Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'gregsexton/gitv'

" Others
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neomake/neomake'
Plug 'vimwiki/vimwiki'
Plug 'rhysd/devdocs.vim'
call plug#end()

colorscheme neodark
if has("termguicolors")
    set termguicolors
endif

" Display relative line numbers
set relativenumber
" display the absolute line number at the line you're on
set number

" Basic Formatting
set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set tabstop=2
:set shiftwidth=2
set expandtab
" Search settings
set ignorecase
set smartcase
set incsearch
set nohlsearch
" Use system clipboard
set clipboard=unnamed
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

let $FZF_DEFAULT_COMMAND="ack -l ''"
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-P> :FZF<CR>
nnoremap <Leader>a :Ack!<Space>
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
nnoremap <Leader><Leader>u :MundoToggle<CR>
nnoremap <Leader>dd :DevDocs<Space>
nnoremap <Leader>DD :DevDocs <C-r><C-w><CR>

let g:airline_powerline_fonts = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:NERDTreeChDirMode = 2
let g:surround_45 = "<% \r %>"
let g:surround_61 = "<%= \r %>"
let g:mundo_prefer_python3 = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ruby = ['omni']
let g:neomake_open_list=2

autocmd! BufWritePost * Neomake

