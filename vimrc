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
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'thoughtbot/vim-rspec'
NeoBundle 'tpope/vim-haml'
NeoBundle 'plasticboy/vim-markdown'

" Dash
NeoBundle 'rizzatti/dash.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l -g ""'

" fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

syntax enable
set number
set ruler
set cursorline
set hlsearch

set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

colorscheme hybrid

noremap <silent> <C-l> :nohl<CR>
noremap <silent> <C-t> :!tig --all<CR>
noremap <silent> <C-s> :Gstatus<CR>
noremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <silent> <S-b> :Gbrowse<CR>
noremap <silent> <S-f> :Git fetch -p<CR>
noremap <S-w> :mks! ~/.vim-session<CR>

" Dashing
nmap <silent> <leader>d <Plug>DashSearch

" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | endif

" Auto maximizing selected window
let &winheight = &lines * 7 / 10

" Better gf for rails
set path+=lib/*/
