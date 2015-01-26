if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

set encoding=utf-8
set termencoding=utf-8

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'tools\\update-dll-mingw',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Bundles
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rking/ag.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'tpope/vim-surround'
NeoBundle 'christoomey/vim-tmux-navigator'

" Color schemes
NeoBundle 'morhetz/gruvbox'

NeoBundle 'pangloss/vim-javascript'
NeoBundle 'kchmck/vim-coffee-script'

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

set background=dark
colorscheme gruvbox

" Fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" 100 times improvement for searching
noremap // y/<C-r><C-w><CR>
noremap /// y/<C-r>"<CR>
noremap /ag :Ag! <C-r><C-w><CR>
noremap <silent> <C-l> :nohl<CR>

" My gits
noremap <silent> <Leader>g :Gstatus<CR>
noremap <silent> <S-t> :Start tig --all<CR>
noremap <silent> <Leader>b :Gbrowse<CR>
noremap <silent> <S-f> :Gfetch --all -p<CR>

" Dashing
nmap <silent> <leader>d <Plug>DashSearch

" Better ag
let g:aghighlight=1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<cr>'],
  \ }

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l -g ""'

" Better NERDTree experience
noremap <silent> <C-n> :NERDTreeToggle<CR>
noremap <silent> ,n :NERDTreeFind<CR>

" Auto maximizing selected window
let &winheight = &lines * 7 / 10

" Better gf for rails
set path+=app/*/,lib/*/,spec/*/,spec/support/*/

" Better rspec
let g:rspec_command = "Dispatch rspec -f d -c {spec}"
noremap <Leader>t :call RunCurrentSpecFile()<CR>
noremap <Leader>s :call RunNearestSpec()<CR>
noremap <Leader>l :call RunLastSpec()<CR>
noremap <Leader>a :call RunAllSpecs()<CR>
