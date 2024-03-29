call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-startify'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'

" Color schemes
Plug 'chriskempson/base16-vim'

" Clojurealm
Plug 'tpope/vim-fireplace'

call plug#end()

syntax enable
set encoding=utf-8
set termencoding=utf-8
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

if filereadable(expand("~/.vimrc_background"))
  source ~/.vimrc_background
endif

" Fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

" Mouse mode
set mouse=a

" Rainbow parens
let g:rainbow_active=1

" Highlight long lines
set colorcolumn=120
highlight ColorColumn ctermbg=darkgrey

" Auto remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" I just hate these modes
nmap q <Nop>
nmap Q <Nop>

" 100 times improvement for searching
nnoremap // y/<C-r><C-w><CR>
vnoremap // y/<C-r>"<CR>
nnoremap /rg :Rg '<C-r>/'<CR>
nnoremap <silent> <leader>/ :nohl<CR>

" and 100 times better for copying
vnoremap <silent> <leader><leader>y "+y
nnoremap <silent> <leader><leader>p "+p

" I need to toggle these too often
set pastetoggle=<leader>p
nnoremap <silent> <leader>n :set invnumber<CR>
nnoremap <silent> <leader>w :set wrap!<CR>

" My gits
nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <S-t> :Start tig --all<CR>
nnoremap <silent> <S-f> :Git fetch --all -p<CR>

" Configure airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'

" Better rg
let g:rg_highlight=1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<cr>'],
  \ }

" Use rg for ctrlp
let g:ctrlp_user_command = 'rg %s -l -g ""'

" Quicker start with ctrlp
let g:ctrlp_reuse_window = 'startify'

" Stay in git root folder
let g:startify_change_to_vcs_root = 1

" Reorder the starting lists
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'files',     'header': ['   MRU ']           },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Stop ctrlp messing up with NERDTree
let g:ctrlp_cmd = ':NERDTreeClose\|CtrlP'

" Better NERDTree experience
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <silent> ,n :NERDTreeFind<CR>

" Auto maximizing selected window
let &winheight = &lines * 6 / 10

" Enable syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Windows HiDPI
set guifont=Cascadia\ Code\ PL:h12:cANSI:qDRAFT
