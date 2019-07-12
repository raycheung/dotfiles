call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'luochen1990/rainbow'
Plug 'vim-airline/vim-airline'

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'

" Color schemes
Plug 'chriskempson/base16-vim'

Plug 'tpope/vim-fireplace'
Plug 'guns/vim-clojure-highlight'
Plug 'venantius/vim-eastwood'
"Plug 'venantius/vim-cljfmt'
Plug 'raycheung/vim-cljfmt'

Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'janko/vim-test'

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
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Fix crontab -e
set backupskip=/tmp/*,/private/tmp/*

" Mouse mode
set mouse=a
set ttymouse=xterm2

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
nnoremap /ag :Ag! '<C-r>/'<CR>
nnoremap <silent> <leader>/ :nohl<CR>

" and 100 times better for copying
vnoremap <silent> <leader><leader>y "+y
nnoremap <silent> <leader><leader>p "+p

" I need to toggle these too often
set pastetoggle=<leader>p
nnoremap <silent> <leader>n :set invnumber<CR>
nnoremap <silent> <leader>w :set wrap!<CR>

" My gits
nnoremap <silent> <leader>g :Gstatus<CR>
nnoremap <silent> <S-t> :Start tig --all<CR>
nnoremap <silent> <leader>b :Gbrowse<CR>
nnoremap <silent> <S-f> :Gfetch --all -p<CR>

" Configure airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '¶'

" Better ag
let g:ag_highlight=1

let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': ['<c-e>', '<2-LeftMouse>'],
  \ 'AcceptSelection("h")': ['<cr>'],
  \ }

" Use ag for ctrlp
let g:ctrlp_user_command = 'ag %s -l -g ""'

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

" Specific for Clojure
autocmd BufNewFile,BufRead *.clj set iskeyword-=.
autocmd BufNewFile,BufRead *.clj set iskeyword-=/

" Enable syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cucumber_cucumber_args='--profile syntastic'
let g:syntastic_javascript_checkers=['jscs', 'flow']
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_sass_checkers = []

" Better gf for rails
set path+=app/**/,lib/**/,spec/**/

" Better vim-test
let test#strategy = 'dispatch'
let g:test#preserve_screen = 1
nmap <silent> <leader>s :TestNearest<CR>
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>j :TestVisit<CR>

" Convert hash rockets syntax
nnoremap <leader>cc :%s/:\([^=,'"]*\) =>/\1:/gc<CR>

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
