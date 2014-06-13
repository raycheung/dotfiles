if &shell =~# 'fish$'
  set shell=bash
endif

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'ervandew/supertab'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'

" Dash
NeoBundle 'rizzatti/dash.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" tell ctrlp to follow .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" even better motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion

" fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

syntax enable
set number
set ruler
set hlsearch

set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set backspace=2

nnoremap <silent> <C-l> :nohl<CR><C-l>

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

colo badwolf
set background=dark

nnoremap <silent> <C-d> :Dash<CR><C-d>
nnoremap <silent> <C-g> :!gulp<CR><C-g>
