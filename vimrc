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
NeoBundle 'godlygeek/tabular'
NeoBundle 'powerman/vim-plugin-AnsiEsc'

" Color schemes
NeoBundle 'NLKNguyen/papercolor-theme'

NeoBundle 'sheerun/vim-polyglot'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'tpope/vim-rbenv'
NeoBundle 'tpope/vim-bundler'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-rake'
NeoBundle 'skalnik/vim-vroom'

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
set laststatus=2

set backspace=2
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab

set background=dark
colorscheme PaperColor

" Fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

" Mouse mode
set mouse=a

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" I just hate these modes
nmap q <Nop>
nmap Q <Nop>

" 100 times improvement for searching
nnoremap // y/<C-r><C-w><CR>
vnoremap // y/<C-r>"<CR>
nnoremap /ag :Ag! '<C-r>/'<CR>
nnoremap <silent> <Leader>/ :nohl<CR>

" and 100 times better for copying
vnoremap <silent> <Leader><Leader>y "+y
nnoremap <silent> <Leader><Leader>p "+p

" I need to toggle these too often
set pastetoggle=<Leader>p
nnoremap <silent> <Leader>n :set invnumber<CR>
nnoremap <silent> <Leader>w :set wrap!<CR>

" My gits
nnoremap <silent> <Leader>g :Gstatus<CR>
nnoremap <silent> <S-t> :Start tig --all<CR>
nnoremap <silent> <Leader>b :Gbrowse<CR>
nnoremap <silent> <S-f> :Gfetch --all -p<CR>

" Dashing
nmap <silent> <leader>d <Plug>DashSearch

" Better ag
let g:ag_highlight=1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<cr>'],
  \ }

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l -g ""'

" Better NERDTree experience
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> ,n :NERDTreeFind<CR>

" Auto maximizing selected window
let &winheight = &lines * 7 / 10

" Enable syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cucumber_cucumber_args="--profile syntastic"
let g:syntastic_javascript_checkers=['jscs']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_sass_checkers = []

" '-' (dash) is not a word separator for me
set iskeyword+=-

" Better gf for rails
set path+=app/**/,lib/**/,spec/**/

" Better vroom
let g:vroom_detect_spec_helper = 1
let g:vroom_use_dispatch = 1

nnoremap <Leader>t :VroomRunTestFile<CR>
nnoremap <Leader>s :VroomRunNearestTest<CR>
nnoremap <Leader>l :VroomRunLastTest<CR>

" Convert hash rockets syntax
nnoremap <Leader>cc :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

" Formatting cucumber table
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" We have custom extension
autocmd BufNewFile,BufRead *.opal set syntax=ruby
autocmd BufNewFile,BufRead *.opal let b:commentary_format='# %s'

autocmd BufReadPost quickfix AnsiEsc
