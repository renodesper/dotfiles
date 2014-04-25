set nocompatible
set t_Co=256
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
let g:vundle_default_git_proto='git'

Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'junegunn/goyo.vim'
Plugin 'sjl/gundo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'gmarik/vundle'
Plugin 'Valloric/YouCompleteMe'

" ==========================================================
" Shortcuts
" ==========================================================

" change the leader to be a comma vs slash
let mapleader=","

" Edit my vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Reload Vimrc
noremap <silent> <leader>sv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" sudo write this
cmap W! w !sudo tee % >/dev/null

" for when we forget to use sudo to open/edit a file
cmap w!! w !sudo tee % >/dev/null

" and lets make these all work in insert mode too ( <C-O> makes next cmd
" happen as if in command mode )
inoremap <C-W> <C-O><C-W>

" Easy escaping to normal model
inoremap jj <esc>

" Fast save
inoremap <leader>w <esc>:w!<cr>a

" Quit window on <leader>q
inoremap <leader>q <esc>:q<CR>

" Select the item in the list with enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Long lines as break lines
map j gj
map k gk
map <Up> k
map <Down> j

" ctrl-hjkl changes to that split
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Easy window resize
nnoremap <silent> <A-h> <C-w><
nnoremap <silent> <A-j> <C-W>-
nnoremap <silent> <A-k> <C-W>+
nnoremap <silent> <A-l> <C-w>>

" Resize horizontal split window
nnoremap <C-Up> <C-w>-<C-w>5-
nnoremap <C-Down> <C-w>+<C-w>5+

" Resize vertical split window
nnoremap <C-Left> <C-w>><C-w>5>
nnoremap <C-Right> <C-w><<C-w>5<

" Moving per page
nnoremap <S-j> <PageDown>
nnoremap <S-k> <PageUp>

" Moving to first or last word in line
nnoremap <S-h> ^
nnoremap <S-l> $

" open/close the quickfix window
nnoremap <leader>c :copen<CR>
nnoremap <leader>cc :cclose<CR>

" Paste from clipboard
noremap <leader>p "+p

" Clear highlight after searching
nnoremap <silent> <leader>/ :silent :nohlsearch<CR>

" Moving between buffer
noremap <C-PageDown> :bnext<CR>
noremap <C-PageUp>   :bprevious<CR>

" Select all
nnoremap <C-a> ggVG$

" Changing : into ;
nnoremap ; :

" Auto change directory to match current file ,cd
nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

" Fast saves
nnoremap <leader>w :w!<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>

" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Automatically add breakpoint for PDB
nnoremap <leader>P Oimport pdb; pdb.set_trace()

" Laravel framework commons
nmap <leader>lr :e app/routes.php<cr>
nmap <leader>lca :e app/config/app.php<cr>81Gf(%O
nmap <leader>lcd :e app/config/database.php<cr>
nmap <leader>lc :e composer.json<cr>

" ==========================================================
" Abbreviations
" ==========================================================

" Laravel abbreviation
abbrev genc !php artisan generate:controller
abbrev genm !php artisan generate:model
abbrev genv !php artisan generate:view
abbrev gens !php artisan generate:seed
abbrev genmig !php artisan generate:migration
abbrev genr !php artisan generate:resource
abbrev mig !php artisan migrate
abbrev migm !php artisan migrate:make

" Other abbreviation
iabbrev @@ reno.esper@gmail.com

" ==========================================================
" Basic Settings
" ==========================================================

syntax on                     " syntax highlighing
filetype on                   " try to detect filetypes
filetype plugin indent on     " enable loading indent file for filetype
set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set antialias
set mouse=a
set background=dark
colorscheme Tomorrow-Night-Bright
set guifont=Meslo\ LG\ S\ for\ Powerline\ 9

" don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=*/vendor/**

" Set paste mode toggle
set pastetoggle=<F10>

" Disable paste mode when leaving insert mode
au InsertLeave * set nopaste

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
" autocmd FileType * setlocal colorcolumn=0

" ==========================================================
" Moving Around/Editing
" ==========================================================

set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=5             " Keep 5 context lines above and below the cursor
set sidescroll=1            " Enable sidescrolling
set sidescrolloff=15
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a parent once it's balanced
set wrap                    " Wrap text
set linebreak               " don't wrap text in the middle of a word
set autoindent              " always set autoindenting on
set copyindent              " copy indent from previous line
set smartindent             " use smart indent if there is no indent file
set tabstop=2               " <tab> inserts 2 spaces
set shiftwidth=2            " And an indent level is 4 spaces wide.
set softtabstop=2           " <BS> over an autoindent deletes all spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=79            " lines are automatically wrapped after 79 columns
set nofoldenable            " turn off folding
set colorcolumn=79          " highlight column 79 (where words will wrap)

if &ft == "scala"
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
endif

if &ft == "python"
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
endif

" Reading/Writing
set autowriteall            " Don't bother me about changed buffers
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set clipboard=unnamed       " yank and paste in visual mode without *:

" Messages, Info, Status
set vb t_vb=                " Disable all bells.  I hate ringing/flashing.
set showcmd                 " Show incomplete normal mode commands as I type.
set noshowmode              " Hide the default mode text
set report=0                " : commands always print changed line count.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
set ruler                   " Show some info, even without statuslines.
set laststatus=2            " Always show statusline, even if only 1 window.

" Searching and Patterns
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
set incsearch               " Incrementally search while typing a /regex

if exists("+undofile")
  " undofile - This allows you to use undos after exiting and restarting
  " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " This is only present in 7.3+
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

hi DiffText gui=underline guibg=red guifg=black

" ==========================================================
" Plugin Setting
" ==========================================================

" Sparkup Setting
if !exists('g:sparkupExecuteMapping')
  let g:sparkupExecuteMapping = '<leader>e'
endif


" Ultisnips trigger
let g:UltiSnipsExpandTrigger="<leader>c"


" Goyo trigger (distraction free)
nnoremap <leader>df :Goyo<cr>


" NERDTree trigger
nmap <C-b> :NERDTreeToggle<cr>


" Vim Less compile .less to .css
nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<CR><space>


" Vim CSS3 Syntax setting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END


" Gundo Setting
let g:gundo_width = 40
let g:gundo_preview_height = 15
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_help = 0
nnoremap <F5> :GundoToggle<CR>


" CtrlP Setting
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'some_bad_symbolic_links',
    \ }


" Syntastic setting
let g:syntastic_python_checkers = ['pyflakes']
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_quiet_messages = { "type": "style" }


" Lightline Setting
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ], ['ctrlpmark'] ],
      \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ 'component_expand': {
      \   'syntastic': 'SyntasticStatuslineFlag',
      \ },
      \ 'component_type': {
      \   'syntastic': 'error',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ fname =~ '__Gundo\|NERD_tree' ? '' :
        \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Gundo\|NERD' && exists('*fugitive#head')
      let mark = ''  " edit here for cool mark
      let _ = fugitive#head()
      return strlen(_) ? mark._ : ''
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  let fname = expand('%:t')
  return fname ==  'ControlP' ? 'CtrlP' :
        \ fname == '__Gundo__' ? 'Gundo' :
        \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
        \ fname =~ 'NERD_tree' ? 'NERDTree' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
  \ 'main': 'CtrlPStatusFunc_1',
  \ 'prog': 'CtrlPStatusFunc_2',
  \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END
function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction

