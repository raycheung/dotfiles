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
NeoBundle 'ervandew/supertab'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'rking/ag.vim'
NeoBundle 'scrooloose/nerdtree'

" Color schemes
"NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'morhetz/gruvbox'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'
"NeoBundle 'burnettk/vim-angular'

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'thoughtbot/vim-rspec'

NeoBundle 'plasticboy/vim-markdown'

" Dash
NeoBundle 'rizzatti/dash.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax enable
set number
set ruler
set cursorline
set hlsearch
set incsearch

set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

colorscheme gruvbox
set background=dark

" Fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" 100 times improvement for searching
noremap // y/<C-r><C-w><CR>
noremap /a :Ag <C-r><C-w><CR>

noremap <silent> <C-l> :nohl<CR>
noremap <silent> <C-t> :!tig --all<CR>
noremap <silent> <C-s> :Gstatus<CR>
noremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <silent> ,n :NERDTreeFind<CR>
noremap <silent> <S-b> :Gbrowse<CR>
noremap <silent> <S-f> :Git fetch -p<CR>

" Dashing
nmap <silent> <leader>d <Plug>DashSearch

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l -g ""'

" NERD Tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | endif

" Auto maximizing selected window
let &winheight = &lines * 7 / 10

" Better gf for rails
set path+=lib/*/

" Better rspec
let g:rspec_command = "!bundle exec rspec -f d -c {spec}"
noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>
