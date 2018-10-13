"
" Best view with a 256 color terminal and Powerline fonts
" Updated by Dorian Neto (https://github.com/dorianneto)"

set nocompatible
set autowrite
set clipboard=unnamed

filetype off


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" ------Plugins-------
"  Utility
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'tpope/vim-surround'
Plugin 'gcmt/breeze.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'szw/vim-maximizer'
Plugin 'rizzatti/dash.vim'
Plugin 'craigemery/vim-autotag'

"  Ruby Support
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-rails'
Plugin 'ngmy/vim-rubocop'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-endwise'
" Plugin 'activebridge/rails-snippets'

"  General Programming Support
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'Raimondi/delimitMate'
" Plugin 'Townk/vim-autoclose'

"  Markdown / Writing
"  Git support
Plugin 'gregsexton/gitv'
Plugin 'kablamo/vim-git-log'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'


"  Php Support
Plugin 'phpvim/phpcd.vim'
Plugin 'tobyS/pdv'

"  Theme / Interface
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'colors'
Plugin 'morhetz/gruvbox'

"  Coffeescript Support
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
set background=dark
colorscheme gruvbox
filetype plugin indent on

""""""""
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.
set autoindent
set backspace=indent,eol,start
set complete-=i
set showmatch
set showmode
set smarttab

set nrformats-=octal
set shiftround

set ttimeout
set ttimeoutlen=50

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set autoread

set encoding=utf-8
set tabstop=2 shiftwidth=2 expandtab
set listchars=tab:▒░,trail:▓
set list

inoremap <C-U> <C-G>u<C-U>

set number
set hlsearch
set ignorecase
set smartcase

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" do not history when leavy buffer
set hidden

" FIXME: (broken) ctrl s to save
noremap  <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>

set nobackup
set nowritebackup
set noswapfile
set fileformats=unix,dos,mac

" exit insert mode
inoremap <C-c> <Esc>

set completeopt=menuone,longest,preview

"
" Plugins config
"
" tagbar config
nmap <F8> :TagbarToggle<CR>

" NERDTree
let mapleader = ','
nmap <Leader>n :NERDTreeFind<CR>
nmap <Leader>m :NERDTreeToggle<CR>
" CtrlP
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

" Ultisnip
" NOTE: <f1> otherwise it overrides <tab> forever
let g:UltiSnipsExpandTrigger="<f1>"
let g:UltiSnipsJumpForwardTrigger="<f1>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:did_UltiSnips_vim_after = 1

" vim-airline
let g:Powerline_symbols = 'unicode'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" enable silver search
let g:ackprg = 'ag --nogroup --nocolor --column'
" autotags
let g:autotagTagsFile="./.tags"
set tags=./.tags,.tags;
" Basic shortcuts definitions
"  most in visual mode / selection (v or ⇧ v)
"

" Find
map <C-f> /
" indent / deindent after selecting the text with (⇧ v), (.) to repeat.
vnoremap <Tab> >
vnoremap <S-Tab> <
" comment / decomment & normal comment behavior
vmap <C-m> gc
" Disable tComment to escape some entities
let g:tcomment#replacements_xml={}
" Text wrap simpler, then type the open tag or ',"
vmap <C-w> S
" Cut, Paste, Copy
vmap <C-x> d
vmap <C-v> p
vmap <C-c> y
" Undo, Redo (broken)
nnoremap <C-z>  :undo<CR>
inoremap <C-z>  <Esc>:undo<CR>
nnoremap <C-y>  :redo<CR>
inoremap <C-y>  <Esc>:redo<CR>
nnoremap <C-b>  :tabprevious<CR>
inoremap <C-b>  <Esc>:tabprevious<CR>i
nnoremap <C-n>  :tabnext<CR>
inoremap <C-n>  <Esc>:tabnext<CR>i
nnoremap tn :tabnew<CR>
nnoremap <C-k>  :tabclose<CR>
inoremap <C-k>  <Esc>:tabclose<CR>i

let mapleader = ','
nnoremap <Leader>p :set paste<CR>
nnoremap <Leader>o :set nopaste<CR>
noremap  <Leader>g :GitGutterToggle<CR>
nmap <silent> <leader>d <Plug>DashSearch
nnoremap <Leader>b :buffers<CR>:buffer<Space>
" this machine config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
" CtrlP config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_clear_cache_on_exit = 0
" let g:ctrlp_lazy_update = 1
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
 
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
 
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
" for search in directory
nnoremap \ :Ack<SPACE>
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Plugin 'scrooloose/syntastic' configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri']
" RuboCop config
let g:vimrubocop_keymap = 0
nmap <Leader>r :RuboCop<CR>
" RSpec config
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" let g:rspec_command = "Dispatch rspec {spec}"

" Plugin 'szw/vim-maximizer' config
map <F2> :Copen
map ` :ccl

" Large files fix
" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile 
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" CtrlP auto cache clearing.
" ----------------------------------------------------------------------------
function! SetupCtrlP()
  if exists("g:loaded_ctrlp") && g:loaded_ctrlp
    augroup CtrlPExtension
      autocmd!
      autocmd FocusGained  * CtrlPClearCache
      autocmd BufWritePost * CtrlPClearCache
    augroup END
  endif
endfunction
if has("autocmd")
  autocmd VimEnter * :call SetupCtrlP()
endif
