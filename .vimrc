if has('vim_starting')
  set nocompatible
  set runtimepath+=.
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" Solarized
" NeoBundle 'altercation/vim-colors-solarized'
" Network oriented reading, writing, and browsing
NeoBundle 'eiginn/netrw'
" Elegant buffer explorer
NeoBundle 'fholgado/minibufexpl.vim'
" Text filtering and alignment (Leader a = / Leader a :)
NeoBundle 'godlygeek/tabular'
" Statusline/tabline for Vim
NeoBundle 'itchyny/lightline.vim'
" Distraction free
NeoBundle 'junegunn/goyo.vim'
" Vim motion on speed (Leader Leader w/f/s)
NeoBundle 'Lokaltog/vim-easymotion'
" Python tag list
NeoBundle 'majutsushi/tagbar'
" Auto close scope (brackets, quotes, etc)
NeoBundle 'Raimondi/delimitMate'
" Awesome HAML to HTML by CTRL-E on HTML files
NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Awesome syntax checking plugin
NeoBundle 'scrooloose/syntastic'
" Snippet engine and snipet lists
NeoBundle 'honza/vim-snippets'
NeoBundle 'SirVer/ultisnips'
" Golang stuff
NeoBundle 'fatih/vim-go'
" PHP stuff
NeoBundle 'StanAngeloff/php.vim'
" Javascript stuff
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
" Visualize your undo tree
NeoBundle 'sjl/gundo.vim'
" Unite, async and tags support
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
NeoBundle 'tsukkee/unite-tag'
" Expand visual selection by multiple '+' and shrink by multiple '_'
NeoBundle 'terryma/vim-expand-region'
" String substitute for singular / plural (context, sensitive)
NeoBundle 'tpope/vim-abolish'
" Language-agnostic commenting plugin (gcc gcap gcgc)
NeoBundle 'tpope/vim-commentary'
" Git integration
NeoBundle 'tpope/vim-fugitive'
" Enable repeating supported plugin
NeoBundle 'tpope/vim-repeat'
" Quoting/parenthesizing made simple (cs'" ds' ysiw] yssb ds{ds))
NeoBundle 'tpope/vim-surround'
" Awesome completion
NeoBundle 'Valloric/YouCompleteMe'
" Multiple cursor
NeoBundle 'terryma/vim-multiple-cursors'
" Stackoverflow from Vim
NeoBundle 'mickaobrien/vim-stackoverflow'
" rxvt Terminal Keys support on tmux
NeoBundle 'nacitar/terminalkeys.vim'
" Wakatime time tracker
NeoBundle 'wakatime/vim-wakatime'

call neobundle#end()
syntax on                     " syntax highlighing
filetype plugin indent on     " Required!
NeoBundleCheck

" ==========================================================
" Abbreviations
" ==========================================================

" Laravel abbreviation
abbrev genc   ! php artisan generate:controller
abbrev genm   ! php artisan generate:model
abbrev genv   ! php artisan generate:view
abbrev gens   ! php artisan generate:seed
abbrev genmig ! php artisan generate:migration
abbrev genr   ! php artisan generate:resource
abbrev mig    ! php artisan migrate
abbrev migm   ! php artisan migrate:make
abbrev stov StackOverflow

" Other abbreviation
iabbrev @@ email
iabbrev env #!/usr/bin/env python2

" ==========================================================
" Remapping
" ==========================================================

" change the leader to be a comma vs slash
let mapleader=","

" Edit my vimrc file
nnoremap <leader>ev :e $MYVIMRC<cr>

" Reload Vimrc
noremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

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
inoremap <leader>q <esc>:q<cr>

" Long lines as break lines
map j gj
map k gk
map <Up> gk
map <Down> gj

" disable arrow keys
"map <up> <nop>
"map <down> <nop>
"map <left> <nop>
"map <right> <nop>

" ctrl-hjkl changes to that split
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Easy window resize
nnoremap <silent> <C-S-h> <C-w><
nnoremap <silent> <C-S-j> <C-W>-
nnoremap <silent> <C-S-k> <C-W>+
nnoremap <silent> <C-S-l> <C-w>>

" Moving per page
nnoremap <S-j> <PageDown>
nnoremap <S-k> <PageUp>

" Moving to first or last word in line
nnoremap <S-h> ^
nnoremap <S-l> $

" open/close the quickfix window
nnoremap <leader>c :copen<cr>
nnoremap <leader>cc :cclose<cr>

" Clear highlight after searching
nnoremap <silent> <leader>/ :silent :nohlsearch<cr>

" New buffer, moving between buffer, close buffer, and list buffer
nmap <leader>T :enew<cr>
nmap <leader>l :bnext<cr>
nmap <leader>h :bprevious<cr>
nmap <leader>bq :bp <bar> bd #<cr>
nmap <leader>bl :ls<cr>

" Select all
nnoremap <C-a> ggVG$

" Copy to copy-and-paste clipboard
vnoremap <C-c> "+y

" Paste from clipboard
noremap <C-v> "+p

" Changing : into ;
nnoremap ; :

" Very magic for Regex
noremap / /\v

" Auto change directory to match current file
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" YCM Completer Goto
nnoremap <leader>yg :YcmCompleter GoTo<CR>
inoremap <leader>yg <esc>:YcmCompleter GoTo<CR>i

" Fast saves
nnoremap <leader>w :w!<cr>

" Quit window on <leader>q
nnoremap <leader>q :q<cr>

" Remove trailing whitespace on <leader>W
" nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>

" Execute itself with python2
nnoremap <leader>p :w !python2<cr>

" ==========================================================
" Basic Settings
" ==========================================================

if has("gui_running")
  set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
  set guioptions-=m
  set guioptions-=T
endif

set number                    " Display line numbers
set title                     " show title in console title bar
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.
set antialias
set dictionary=/usr/share/dict/usa
set mouse=a

" Color and tmux
if &term =~ '256color'
  " map <Esc>OH <Home>
  " map! <Esc>OH <Home>
  " map <Esc>OF <End>
  " map! <Esc>OF <End>
  set t_ut=
endif
set t_Co=256

set background=dark
colorscheme Tomorrow-Night-Eighties
hi DiffText gui=underline guibg=red guifg=black

" Solarized setting
" let g:solarized_termcolors=256

" Don't bell or blink
set noerrorbells
set vb t_vb=

" Ignore these files when completing
set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png
set wildignore+=*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl
set wildignore+=*.sw?,*.DS_Store?,*.class,eggs/**,*.egg-info/**,*/vendor/**

" Set paste mode toggle
set pastetoggle=<F2>

" Disable paste mode when leaving insert mode
au InsertLeave * set nopaste

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
set tabstop=4               " <tab> inserts 'x' spaces
set shiftwidth=4            " And an indent level is 'x' spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes all spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set formatoptions=tcroql    " Setting text and comment formatting to auto
set textwidth=79            " lines are automatically wrapped after 79 columns
set nofoldenable            " turn off folding
set colorcolumn=79          " highlight column 79 (where words will wrap)

if &ft == 'python'
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endif

" Reading/Writing
set autowriteall            " Don't bother me about changed buffers
"set noautoread              " Don't automatically re-read changed files.
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

" ==========================================================
" Plugin Setting
" ==========================================================

" Tagbar mapping
nnoremap <F3> :TagbarToggle<cr>
inoremap <F3> <esc>:TagbarToggle<cr>i

" Gundo mapping
nnoremap <F4> :GundoToggle<cr>
inoremap <F4> <esc>:GundoToggle<cr>i

" Goyo mapping (distraction free)
nnoremap <F5> :Goyo<cr>
inoremap <F5> <esc>:Goyo<cr>i

" Go
au FileType go call GoOptions()
function! GoOptions()
  let g:go_highlight_functions = 1
  let g:go_highlight_methods = 1
  let g:go_highlight_structs = 1
  let g:go_fmt_command = "goimports"
  let g:go_fmt_fail_silently = 1
  let g:go_play_open_browser = 0
endfunction
au FileType go nmap <Leader>gs <Plug>(go-implements)
au FileType go nmap <Leader>gi <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>gr :!go run %<CR>
au FileType go nmap <leader>gb <Plug>(go-build)
au FileType go nmap <leader>gt <Plug>(go-test)
au FileType go nmap <leader>gc <Plug>(go-coverage)
au FileType go nmap <Leader>ge <Plug>(go-rename)

" Tabular Mapping
if exists(":Tabularize")
  nmap <leader>a= :Tabularize /=<CR>
  vmap <leader>a= :Tabularize /=<CR>
  nmap <leader>a: :Tabularize /:\zs<CR>
  vmap <leader>a: :Tabularize /:\zs<CR>
endif

" Ultisnips mapping
let g:UltiSnipsExpandTrigger="<leader><Tab>"

"Unite mapping
nnoremap [unite] <Nop>
nmap <space> [unite]
nnoremap [unite]f :Unite -start-insert file<cr>
nnoremap [unite]a :Unite -start-insert file_rec/async<cr>
nnoremap [unite]t :Unite -start-insert tag<cr>
nnoremap [unite]g :Unite grep:.<cr>
nnoremap [unite]h :Unite -quick-match history/yank<cr>
nnoremap [unite]r :Unite -quick-match file_mru<cr>
nnoremap [unite]b :Unite -quick-match buffer<cr>

" Vim multiple cursor mapping
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Vim Less compile .less to .css
" nnoremap <leader>m :w <BAR> !lessc % > %:t:r.css<cr><space>

" Vim CSS3 Syntax Setting
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

" Vim Expand Region Setting
map + <Plug>(expand_region_expand)
map _ <Plug>(expand_region_shrink)

" Gundo Setting
let g:gundo_width = 40
let g:gundo_preview_height = 15
let g:gundo_right = 1
let g:gundo_preview_bottom = 1
let g:gundo_help = 0

" HTML, PHP Setting
autocmd FileType html,php call WebSetting()
function! WebSetting()
  "g:php_syntax_extensions_enabled
  set nowrap
endfunction

" Sparkup Setting
let g:sparkupExecuteMapping = '<leader>e'

" JS Beautify Setting
let g:used_javascript_libs = 'jquery'
autocmd FileType javascript noremap <buffer> <leader>f :%!js-beautify -w 79 -j -q -B -f -<cr>
autocmd FileType html,php noremap <buffer> <leader>f :%!html-beautify -w 79 -f -<cr>
autocmd FileType css noremap <buffer> <leader>f :%!css-beautify -f -<cr>

" Syntastic Setting
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_python_checkers = ['pylint2']
let g:syntastic_php_checkers = ['php']
let g:syntastic_quiet_messages = { "type": "style" }

" Unite Setting
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
  let g:unite_source_history_yank_enable = 1
endfunction
call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_hidden_files', 'sorter_rank'])

" YCM Setting
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Lightline Setting
let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ],
  \   'right': [ [ 'syntastic', 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'fugitive': 'MyFugitive',
  \   'filename': 'MyFilename',
  \   'fileformat': 'MyFileformat',
  \   'filetype': 'MyFiletype',
  \   'fileencoding': 'MyFileencoding',
  \   'mode': 'MyMode',
  \ },
  \ 'component_expand': {
  \   'syntastic': 'SyntasticStatuslineFlag',
  \ },
  \ 'component_type': {
  \   'syntastic': 'error',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
  \ }

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFilename()
  let fname = expand('%:t')
  return fname =~ '__Gundo\' ? '' :
    \ ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
    \ ('' != fname ? fname : '[No Name]') .
    \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if expand('%:t') !~? 'Gundo\' && exists('*fugitive#head')
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
    \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

augroup AutoSyntastic
  autocmd!
  autocmd BufWritePost *.c,*.cpp call s:syntastic()
augroup END

function! s:syntastic()
  SyntasticCheck
  call lightline#update()
endfunction
