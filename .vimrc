set nocompatible

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.vim/bundle'))

" General {
    Plug 'airblade/vim-rooter'  " Changes the working directory to the project root"
    Plug 'eiginn/netrw'  " Network oriented reading, writing, and browsing
    Plug 'fholgado/minibufexpl.vim'  " Elegant buffer explorer
    Plug 'itchyny/lightline.vim'  " Statusline/tabline for Vim
    Plug 'junegunn/goyo.vim'  " Distraction free
    Plug 'Lokaltog/vim-easymotion'  " Vim motion on speed (Leader Leader w/f/s)
    Plug 'mhinz/vim-startify'  " Start screen
    Plug 'nacitar/terminalkeys.vim'  " rxvt Terminal Keys support on tmux
    Plug 'ntpeters/vim-better-whitespace', {'on': 'ToggleStripWhitespaceOnSave'}  " Trim whitespace
    Plug 'sjl/gundo.vim'  " Visualize your undo tree
    Plug 'terryma/vim-multiple-cursors'  " Multiple cursor
    Plug 'tpope/vim-abolish'  " String substitute for singular / plural (context, sensitive)
    Plug 'tyru/open-browser.vim'  " Open URI with browser
    Plug 'vasconcelloslf/vim-interestingwords'  " Highlights all the occurrences of word
    Plug 'wincent/terminus'  " Enhanced terminal integration for Vim
" }

" General Programming {
    Plug 'airblade/vim-gitgutter'  " Git Gutter
    Plug 'junegunn/vim-easy-align'  " A simple, easy-to-use Vim alignment plugin
    Plug 'majutsushi/tagbar'  " Python tag list
    Plug 'mickaobrien/vim-stackoverflow'  " Stackoverflow from Vim
    Plug 'Raimondi/delimitMate'  " Auto close scope (brackets, quotes, etc)
    Plug 'scrooloose/syntastic'  " Awesome syntax checking plugin
    Plug 'terryma/vim-expand-region'  " Expand visual selection by multiple '+' and shrink by multiple '_'
    Plug 'tpope/vim-commentary'  " Language-agnostic commenting plugin (gcc gcap gcgc)
    Plug 'tpope/vim-fugitive'  " Git integration
    Plug 'tpope/vim-repeat'  " Enable repeating supported plugin
    Plug 'tpope/vim-surround'  " Quoting/parenthesizing made simple (cs'` ds' ysiw] yssb ds{ds))
" }

" Snippets & AutoComplete {
    Plug 'ervandew/supertab'
    Plug 'honza/vim-snippets'  " vim-snipmate default snippets
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Fuzzy finder
    Plug 'junegunn/fzf.vim'  "Fuzzy finder for vim
    " Plug 'Shougo/neocomplete.vim'  " Autocompletion for vim
    Plug 'SirVer/ultisnips'  " The ultimate snippet solution for Vim
    Plug 'Valloric/YouCompleteMe', { 'dir': '~/.vim/bundle/YouCompleteMe', 'do': 'python2 install.py --clang-completer --omnisharp-completer --gocode-completer --tern-completer --racer-completer' }  " A code-completion engine for Vim
" }

" Deps {
    if executable('ag')
      Plug 'rking/ag.vim'  " The Silver Searcher
      let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
    endif
" }

" Misc {
    Plug 'cespare/vim-toml', {'for': 'toml'}
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
" }

" Go {
    Plug 'fatih/vim-go', {'for': 'go'}
" }

" Haskell {
    " Plug 'adinapoli/cumino', {'for': 'haskell'}
    " Plug 'bitc/vim-hdevtools', {'for': 'haskell'}
    " Plug 'dag/vim2hs', {'for': 'haskell'}
    " Plug 'eagletmt/ghcmod-vim', {'for': 'haskell'}
    " Plug 'eagletmt/neco-ghc', {'for': 'haskell'}
    Plug 'nbouscal/vim-stylish-haskell'
    " Plug 'lukerandall/haskellmode-vim', {'for': 'haskell'}
    " Plug 'travitch/hasksyn', {'for': 'haskell'}
    " Plug 'Twinside/vim-haskellConceal', {'for': 'haskell'}
    " Plug 'Twinside/vim-haskellFold', {'for': 'haskell'}
" }

" HTML {
    Plug 'gorodinskiy/vim-coloresque', {'for': ['html', 'css', 'less', 'sass', 'scss']}
    Plug 'hail2u/vim-css3-syntax', {'for': ['html', 'css', 'less', 'sass', 'scss']}
    Plug 'rstacruz/sparkup', {'for': ['html', 'css', 'less', 'sass', 'scss']}
    Plug 'tpope/vim-haml', {'for': ['html', 'css', 'less', 'sass', 'scss']}
" }

" Lua {
    Plug 'WolfgangMehner/lua-support', {'for': ['lua', 'love']}
" }

" Java {

" }

" Javascript {
    Plug 'briancollins/vim-jst', {'for': ['html', 'php', 'js', 'less', 'sass', 'scss']}
    Plug 'elzr/vim-json', {'for': ['html', 'php', 'js', 'less', 'sass', 'scss', 'json']}
    Plug 'groenewege/vim-less', {'for': ['html', 'php', 'js', 'less', 'sass', 'scss']}
    Plug 'kchmck/vim-coffee-script', {'for': ['html', 'php', 'js', 'less', 'sass', 'scss']}
    Plug 'pangloss/vim-javascript', {'for': ['html', 'php', 'js', 'less', 'sass', 'scss']}
" }

" PHP {
    Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
    Plug 'beyondwords/vim-twig', {'for': 'php'}
    Plug 'spf13/PIV', {'for': 'php'}
" }

" Python {
    Plug 'davidhalter/jedi-vim', {'for': 'python'}
    Plug 'jmcomets/vim-pony', {'for': 'python'}
" }

" Ruby {
    Plug 'tpope/vim-rails', {'for': 'ruby'}
" }

call plug#end()

""" Abbreviations {
  """ Laravel abbreviation {
    " abbrev genc   ! php artisan generate:controller
    " abbrev genm   ! php artisan generate:model
    " abbrev genv   ! php artisan generate:view
    " abbrev gens   ! php artisan generate:seed
    " abbrev genmig ! php artisan generate:migration
    " abbrev genr   ! php artisan generate:resource
    " abbrev mig    ! php artisan migrate
    " abbrev migm   ! php artisan migrate:make
  """ }

  """ Other abbreviation {
    abbrev stov StackOverflow
  """ }
""" }

""" Mapping {
  """ Change the leader to be a comma vs slash
  let mapleader=","

  """ Changing : into ;
  nnoremap ; :

  """ Edit my vimrc file
  nnoremap <F9> :split $MYVIMRC<cr>
  inoremap <F9> <esc>:split $MYVIMRC<cr>

  """ Reload Vimrc
  nnoremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>
  inoremap <leader>rv <esc>:source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

  """ sudo write this
  cmap W! w !sudo tee % >/dev/null

  """ for when we forget to use sudo to open/edit a file
  cmap w!! w !sudo tee % >/dev/null

  """ and lets make these all work in insert mode too ( <C-O> makes next cmd
  """ happen as if in command mode )
  inoremap <C-W> <C-O><C-W>

  """ Easy escaping to normal model
  inoremap jj <esc>

  """ Fast save
  inoremap <leader>w <esc>:w!<cr>a

  """ Quit window on <leader>q
  inoremap <leader>q <esc>:q<cr>

  """ Long lines as break lines
  map j gj
  map k gk
  map <Down> gj
  map <Up> gk

  """ Disable arrow keys
  map <up> <nop>
  map <down> <nop>
  map <left> <nop>
  map <right> <nop>

  " Edit mapping
  cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
  map <leader>ew :e %%
  map <leader>es :sp %%
  map <leader>ev :vsp %%
  map <leader>et :tabe %%

  """ Common shortcut
  nnoremap <C-d> yyp
  nnoremap <C-x> dd

  """ ctrl-hjkl changes to that split
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  """ Easy window resize
  nnoremap <silent> <C-S-h> <C-w><
  nnoremap <silent> <C-S-j> <C-W>-
  nnoremap <silent> <C-S-k> <C-W>+
  nnoremap <silent> <C-S-l> <C-w>>

  """ Moving per page
  nnoremap <S-j> <PageDown>
  nnoremap <S-k> <PageUp>

  """ open/close the quickfix window
  " nnoremap <leader>c :copen<cr>
  " nnoremap <leader>cc :cclose<cr>

  """ Clear highlight after searching
  nnoremap <silent> <leader>/ :silent :nohlsearch<cr>

  """ New buffer, moving between buffer, delete buffer, and list buffer
  nmap <leader>bt :enew<cr>
  nmap <leader>bn :bnext<cr>
  nmap <leader>bp :bprevious<cr>
  nmap <leader>bd :bp <bar> bd #<cr>
  nmap <leader>bl :ls<cr>

  """ Copy to copy-and-paste clipboard
  vnoremap <C-c> "+y

  """ Paste from clipboard
  inoremap <C-v> <Esc>"+pa
  nnoremap <C-v> "+p

  """ Very magic for Regex
  noremap / /\v

  """ Auto change directory to match current file
  nnoremap <leader><leader>cd :cd %:p:h<cr>:pwd<cr>

  """ Fast saves
  nnoremap <leader>w :w!<cr>

  """ Quit window on <leader>q
  nnoremap <leader>q :q<cr>

  """ Visual shifting
  vnoremap < <gv
  vnoremap > >gv

  """ Allow repeat with visual selection
  vnoremap . :normal .<CR>

  """ Fix ABCD when pressing arrow keys
  " the following simply creates an ambiguous mapping so vim fully
  " processes the escape sequence for terminal keys, see 'ttimeout' for a
  " rough explanation, this just forces it to work
  if &term[:4] == "xterm" || &term[:5] == 'screen' || &term[:3] == 'rxvt'
    inoremap <silent> <C-[>OC <RIGHT>
  endif
""" }

""" Basic Settings {
  if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
  endif

  if has("gui_running")
    set guifont=Fira\ Mono\ 10
    set guioptions-=m
    set guioptions-=T
  endif

  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  """ Completion (OmniComplete)
  au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
  set completeopt-=preview

  set number                    " Display line numbers
  set title                     " show title in console title bar
  set wildmenu                  " Menu completion in command mode on <Tab>
  set wildmode=full             " <Tab> cycles between all matching choices.
  set antialias
  set dictionary=/usr/share/dict/usa
  set mouse=a

  """ Color and tmux
  if &term =~ '^screen-256color'
    map  <Esc>[1~ <Home>
    map! <Esc>[1~ <Home>
    map  <Esc>[4~ <End>
    map! <Esc>[4~ <End>
    set t_ut=
    set t_Co=256
  endif

  set background=light
  colorscheme hemisu
  " hi DiffText gui=underline guibg=red guifg=black

  """ Don't bell or blink
  set noerrorbells
  set vb t_vb=

  """ Ignore these files when completing
  set wildignore+=.hg,.git,.svn,*.aux,*.out,*.toc,*.jpg,*.bmp,*.gif,*.png
  set wildignore+=*.jpeg,*.luacd,*.o,*.obj,*.exe,*.dll,*.manifest,*.pyc,*.spl
  set wildignore+=*.sw?,*.DS_Store?,*.class,eggs/**,*.egg-info/**,*/vendor/**

  """ Set paste mode toggle
  set pastetoggle=<F2>

  """ Disable paste mode when leaving insert mode
  au InsertLeave * set nopaste
""" }

""" Moving Around/Editing {
  set cursorline              " have a line indicate the cursor location
  set ruler                   " show the cursor position all the time
  set nostartofline           " Avoid moving cursor to BOL when jumping around
  set virtualedit=block       " Let cursor move past the last char in <C-v> mode
  set scrolloff=3             " Keep 5 context lines above and below the cursor
  set sidescroll=1            " Enable sidescrolling
  set sidescrolloff=15
  set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
  set showmatch               " Briefly jump to a parent once it's balanced
  set wrap                    " Wrap text
  " set linebreak               " don't wrap text in the middle of a word
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
  " set colorcolumn=79          " highlight column 79 (where words will wrap)
  set nofoldenable            " turn off folding
  set splitright              " vsplit to right
  set splitbelow              " split to below

  if &ft == 'css' || &ft == 'sass' || &ft == 'scss'
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
  endif

  if &ft =='md'
    au BufNewFile,BufReadPost *.md set filetype=markdown
  endif

  """ Reading/Writing
  set autowriteall            " Don't bother me about changed buffers
  set autoread                " Automatically re-read changed files.
  set modeline                " Allow vim options to be embedded in files;
  set modelines=5             " they must be within the first or last 5 lines.
  set clipboard=unnamed       " yank and paste in visual mode without *:

  """ Messages, Info, Status
  set showcmd                 " Show incomplete normal mode commands as I type.
  set noshowmode              " Hide the default mode text
  set report=0                " : commands always print changed line count.
  set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
  set ruler                   " Show some info, even without statuslines.
  set laststatus=2            " Always show statusline, even if only 1 window.

  """ Searching and Patterns
  set ignorecase              " Default to using case insensitive searches,
  set smartcase               " unless uppercase letters are used in the regex.
  set hlsearch                " Highlight searches by default.
  set incsearch               " Incrementally search while typing a /regex

  """ Vim files
  if isdirectory($HOME.'/.vim/files') == 0
    call mkdir($HOME.'/.vim/files')
  endif

  """ Backup File
  if isdirectory($HOME.'/.vim/files/backup') == 0
    call mkdir($HOME.'/.vim/files/backup')
  endif
  set backup
  set backupdir=$HOME/.vim/files/backup/
  set backupext=-vimbackup

  """ Swap File
  if isdirectory($HOME.'/.vim/files/swap') == 0
    call mkdir($HOME.'/.vim/files/swap')
  endif
  set directory=$HOME/.vim/files/swap/
  set updatecount =100

  """ Undo File
  if exists("+undofile")
    if isdirectory($HOME.'/.vim/files/undo') == 0
      call mkdir($HOME.'/.vim/files/undo')
    endif
    set undofile
    set undodir=$HOME/.vim/files/undo/
  endif
""" }

""" Info
set viminfo='100,n$HOME/.vim/files/viminfo

""" User Defined Function {
  function! GradleImport()
    :exec '!gradle eclipse'
    :exec 'ProjectImport .'
  endfunction

  function! MvnImport()
    :exec '!mvn eclipse:eclipse'
    :exec 'ProjectImport .'
  endfunction
""" }

""" Plugin Setting & Mapping {
  """ Compile and Run current file
  function! Compile()
    if &ft == 'java'
      :exec '!javac' expand("%")
    endif
  endfunction

  function! Run()
    if &ft == 'go'
      :exec '!go run' expand("%")
    endif

    if &ft == 'java'
      :exec '!java' expand("%:t:r")
    endif

    if &ft == 'javascript'
      :exec '!node' expand("%")
    endif

    if &ft == 'lua'
      :exec '!lua' expand("%")
    endif

    if &ft == 'python'
      :exec '!python2' expand("%")
    endif

    if &ft == 'ruby'
      :exec '!ruby' expand("%")
    endif
  endfunction
  noremap <buffer> <leader>c :call Compile()<cr>
  noremap <buffer> <leader>r :call Run()<cr>
  inoremap <buffer> <leader>c <esc>:call Compile()<cr>
  inoremap <buffer> <leader>r <esc>:call Run()<cr>

  """ Ctags Setting {
    if isdirectory($HOME.'/.vim/files/tags') == 0
      call mkdir($HOME.'/.vim/files/tags')
    endif
    set tags=./tags/;/,$HOME/.vim/files/tags/
  """ }

  """ Easymotion Setting & Mapping {
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    nmap f <Plug>(easymotion-s2)
  """ }

  """ Eclim Setting {
    let g:EclimCompletionMethod = 'omnifunc'
  """ }

  """ Go Setting {
    au FileType go call GoOptions()
    function! GoOptions()
      let g:go_highlight_functions = 1
      let g:go_highlight_methods = 1
      let g:go_highlight_structs = 1
      let g:go_fmt_command = "goimports"
      let g:go_fmt_fail_silently = 1
      let g:go_play_open_browser = 0
    endfunction

    au FileType go call GoMap()
    function! GoMap()
      au FileType go nmap <Leader>gs <Plug>(go-implements)
      au FileType go nmap <Leader>gi <Plug>(go-info)
      au FileType go nmap <Leader>gd <Plug>(go-doc)
      au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
      au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
      au FileType go nmap <leader>gr :!go run %<cr>
      au FileType go nmap <leader>gb <Plug>(go-build)
      au FileType go nmap <leader>gt <Plug>(go-test)
      au FileType go nmap <leader>gc <Plug>(go-coverage)
      au FileType go nmap <Leader>ge <Plug>(go-rename)
    endfunction
  """ }

  """ Goyo Mapping (distraction free) {
    nnoremap <F5> :Goyo<cr>
    inoremap <F5> <esc>:Goyo<cr>i
  """ }

  """ Gundo Setting & Mapping {
    let g:gundo_width = 40
    let g:gundo_preview_height = 15
    let g:gundo_right = 1
    let g:gundo_preview_bottom = 1
    let g:gundo_help = 0
    nnoremap <F4> :GundoToggle<cr>
    inoremap <F4> <esc>:GundoToggle<cr>i
  """ }

  """ Jedi Setting {
    let g:jedi#completions_command = "<C-n>"
    let g:jedi#goto_command = "<leader>d"
    let g:jedi#goto_assignments_command = "<leader>g"
    let g:jedi#goto_definitions_command = ""
    let g:jedi#documentation_command = "K"
    let g:jedi#usages_command = "<leader>n"
    let g:jedi#completions_command = "<C-Space>"
    let g:jedi#rename_command = "<leader>r"
  """ }

  """ JS Beautify Setting {
    let g:used_javascript_libs = 'jquery'
    au FileType javascript noremap <buffer> <leader>f :%!js-beautify -w 79 -j -q -B -f -<cr>
    au FileType html,php noremap <buffer> <leader>f :%!html-beautify -w 79 -f -<cr>
    au FileType css noremap <buffer> <leader>f :%!css-beautify -f -<cr>
  """ }

  """ NeoComplete Setting {
    " let g:acp_enableAtStartup = 0  " Disable AutoComplPop
    " let g:neocomplete#enable_at_startup = 1  " Use neocomplete
    " let g:neocomplete#enable_smart_case = 1  " Use smartcase
    " let g:neocomplete#enable_auto_delimiter = 1
    " let g:neocomplete#enable_auto_select = 0
    " let g:neocomplete#max_list = 15
    " let g:neocomplete#force_overwrite_completefunc = 1
    " let g:neocomplete#sources#syntax#min_keyword_length = 1
    " let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

    " " Define dictionary
    " let g:neocomplete#sources#dictionary#dictionaries = {
    "   \ 'default' : '',
    "   \ 'vimshell' : $HOME.'/.vimshell_hist',
    "   \ 'scheme' : $HOME.'/.gosh_completions'
    "   \ }

    " " Define keyword
    " if !exists('g:neocomplete#keyword_patterns')
    "   let g:neocomplete#keyword_patterns = {}
    " endif
    " let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " " Enable omni completion
    " au FileType css setlocal omnifunc=csscomplete#CompleteCSS
    " au FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    " au FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    " au FileType python setlocal omnifunc=pythoncomplete#Complete
    " au FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    " au FileType ruby setlocal omnifunc=rubycomplete#Complete
    " au FileType haskell setlocal omnifunc=necoghc#omnifunc

    " " Enable heavy omni completion
    " if !exists('g:neocomplete#sources#omni#input_patterns')
    "   let g:neocomplete#sources#omni#input_patterns = {}
    " endif
    " let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    " let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    " let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    " " Plugin key-mappings.
    " inoremap <expr><C-g>     neocomplete#undo_completion()
    " inoremap <expr><C-l>     neocomplete#complete_common_string()

    " """ NeoComplete mapping
    " inoremap <expr><C-y> neocomplete#smart_close_popup()
    " " <ESC> takes you out of insert mode
    " inoremap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
    " " <CR>: close popup and save indent
    " inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " " <TAB>: completion
    " inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
    " " <BS>: close popup and delete backword char"
    " inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " " Close popup by <Space> and insert <Space>
    " inoremap <expr><Space> neocomplete#close_popup() . "\<Space>"
  """ }

  """ PIV Setting {
    let g:DisableAutoPHPFolding = 0
    let g:PIVAutoClose = 0
  """ }

  """ Pony (Django) Setting {
    let g:pony_prefix = "D"
    let g:pony_display_colors = 1
    let g:pony_manage_filename = "manage.py"
    let g:pony_python_cmd = "python"
  """ }

  """ Sparkup Setting {
    let g:sparkupExecuteMapping = '<leader>e'
  """ }

  """ Supertab Setting {
    let g:SuperTabDefaultCompletionType = '<C-n>'
  """ }

  """ Syntastic Setting {
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['pylint2']
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_quiet_messages = { "type": "style" }
    let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
    let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
  """ }

  """ Tagbar Mapping {
    nnoremap <F3> :TagbarToggle<cr>
    inoremap <F3> <esc>:TagbarToggle<cr>i
  """ }

  """ Ultisnips {
    let g:UltiSnipsSnippetDirectories = ['UltiSnips', 'snippet']
    let g:UltiSnipsExpandTrigger="<Tab>"
    let g:UltiSnipsJumpForwardTrigger="<Tab>"
    let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
  """ }

  """ Vim CSS3 Syntax Setting {
    augroup VimCSS3Syntax
      au!
      au FileType css setlocal iskeyword+=-
    augroup END
  """ }

  """ Vim Easy Align {
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)
    " Start interactive EasyAlign for a motion/text object (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
  """ }

  """ Vim Expand Region Setting {
    map + <Plug>(expand_region_expand)
    map _ <Plug>(expand_region_shrink)
  """ }

  """ Vim Indent Guide {
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
  """ }

  """ Vim Multiple Cursor Mapping {
    let g:multi_cursor_next_key = '<C-n>'
    let g:multi_cursor_prev_key = '<C-p>'
    let g:multi_cursor_skip_key = '<C-x>'
    let g:multi_cursor_quit_key = '<Esc>'
  """ }

  """ Vim Rails {
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
  """ }

  """ Web Setting {
    au FileType html,php,css,sass,scss call WebSetting()
    function! WebSetting()
      set nowrap
    endfunction
  """ }

  """ YouCompleteMe {
    let g:ycm_register_as_syntastic_checker = 1  " default 1
    let g:Show_diagnostics_ui = 1  " default 1

    " will put icons in Vim's gutter on lines that have a diagnostic set.
    " Turning this off will also turn off the YcmErrorLine and YcmWarningLine
    " highlighting
    let g:ycm_enable_diagnostic_signs = 1
    let g:ycm_enable_diagnostic_highlighting = 0
    let g:ycm_always_populate_location_list = 1  " default 0
    let g:ycm_open_loclist_on_ycm_diags = 1  " default 1

    let g:ycm_complete_in_strings = 1  " default 1
    let g:ycm_collect_identifiers_from_tags_files = 0  " default 0
    let g:ycm_path_to_python_interpreter = ''  "default ''

    let g:ycm_server_use_vim_stdout = 0  " default 0 (logging to console)
    let g:ycm_server_log_level = 'info'  " default info

    let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'  " where to search for ycm_extra_conf.py if not found
    let g:ycm_confirm_extra_conf = 1

    let g:ycm_goto_buffer_command = 'same-buffer'  " [ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
    let g:ycm_filetype_whitelist = { '*': 1 }
    let g:ycm_key_invoke_completion = '<C-Space>'
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

    if has('python3')
      let g:loaded_youcompleteme = 1 " disables loading it! doesnt support python3
      let g:jedi#force_py_version = 3
      let g:pymode_python = 'python3'
    endif
  """ }

  """ Lightline Setting {
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
      au!
      au BufWritePost *.c,*.cpp call s:syntastic()
    augroup END

    function! s:syntastic()
      SyntasticCheck
      call lightline#update()
    endfunction
  """ }
""" }
