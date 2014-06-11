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
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-haml'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

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
