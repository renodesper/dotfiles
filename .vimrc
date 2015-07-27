set nocompatible
set runtimepath+=.

call neobundle#begin(expand('~/.vim/bundle/'))

""" General {
  NeoBundle 'ConradIrwin/vim-bracketed-paste'  " No need for :set paste!
  NeoBundle 'eiginn/netrw'  " Network oriented reading, writing, and browsing
  NeoBundle 'fholgado/minibufexpl.vim'  " Elegant buffer explorer
  NeoBundle 'itchyny/lightline.vim'  " Statusline/tabline for Vim
  NeoBundle 'junegunn/goyo.vim'  " Distraction free
  NeoBundle 'Lokaltog/vim-easymotion'  " Vim motion on speed (Leader Leader w/f/s)
  NeoBundle 'mhinz/vim-startify'  " Start screen
  NeoBundle 'nacitar/terminalkeys.vim'  " rxvt Terminal Keys support on tmux
  NeoBundle 'ntpeters/vim-better-whitespace'  " Trim whitespace
  NeoBundle 'sjl/gundo.vim'  " Visualize your undo tree
  NeoBundle 'terryma/vim-multiple-cursors'  " Multiple cursor
  NeoBundle 'tpope/vim-abolish'  " String substitute for singular / plural (context, sensitive)
  NeoBundle 'tyru/open-browser.vim'
""" }

""" General Programming {
  NeoBundle 'godlygeek/tabular'  " Text filtering and alignment (Leader a = / Leader a :)
  NeoBundle 'lambdalisue/vim-gista'  " Gist
  NeoBundle 'majutsushi/tagbar'  " Python tag list
  NeoBundle 'mickaobrien/vim-stackoverflow'  " Stackoverflow from Vim
  NeoBundle 'Raimondi/delimitMate'  " Auto close scope (brackets, quotes, etc)
  NeoBundle 'scrooloose/syntastic'  " Awesome syntax checking plugin
  NeoBundle 'terryma/vim-expand-region'  " Expand visual selection by multiple '+' and shrink by multiple '_'
  NeoBundle 'tpope/vim-commentary'  " Language-agnostic commenting plugin (gcc gcap gcgc)
  NeoBundle 'tpope/vim-fugitive'  " Git integration
  NeoBundle 'tpope/vim-surround'  " Quoting/parenthesizing made simple (cs'` ds' ysiw] yssb ds{ds))
  NeoBundle 'tpope/vim-repeat'  " Enable repeating supported plugin
""" }

""" Snippets & AutoComplete {
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'Shougo/neocomplete.vim.git'
  NeoBundle 'Shougo/neosnippet'
  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'SirVer/ultisnips'
""" }

""" Go {
  NeoBundle 'fatih/vim-go'
""" }

""" Haskell {
  " NeoBundle 'adinapoli/cumino'
  " NeoBundle 'bitc/vim-hdevtools'
  " NeoBundle 'dag/vim2hs'
  " NeoBundle 'eagletmt/ghcmod-vim'
  " NeoBundle 'eagletmt/neco-ghc'
  " NeoBundle 'lukerandall/haskellmode-vim'
  " NeoBundle 'travitch/hasksyn'
  " NeoBundle 'Twinside/vim-haskellConceal'
  " NeoBundle 'Twinside/vim-haskellFold'
""" }

""" HTML {
  NeoBundle 'gorodinskiy/vim-coloresque'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}  " Awesome HAML to HTML by CTRL-E on HTML files
  NeoBundle 'tpope/vim-haml'  " Vim runtime files for Haml, Sass, and SCSS
""" }

""" Javascript {
  NeoBundle 'briancollins/vim-jst'
  NeoBundle 'elzr/vim-json'
  NeoBundle 'groenewege/vim-less'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'pangloss/vim-javascript'
""" }

""" PHP {
  NeoBundle 'arnaud-lb/vim-php-namespace'
  NeoBundle 'beyondwords/vim-twig'
  NeoBundle 'spf13/PIV'
""" }

""" Python {
  NeoBundle 'jmcomets/vim-pony'  " Django Snippet
  NeoBundle 'klen/python-mode'  " Pick either python-mode or pyflakes & pydoc
  NeoBundle 'python_match.vim'
  NeoBundle 'pythoncomplete'
  NeoBundle 'yssource/python.vim'
""" }

""" Ruby {
  NeoBundle 'tpope/vim-rails'
  let g:rubycomplete_buffer_loading = 1
  " let g:rubycomplete_classes_in_global = 1
  " let g:rubycomplete_rails = 1
""" }

""" Misc {
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'cespare/vim-toml'
""" }

""" Unite, async, and unite tags support {
  NeoBundle 'Shougo/neomru.vim'
  NeoBundle 'Shougo/unite.vim'
  NeoBundle 'Shougo/vimproc.vim', { 'build' : { 'unix' : 'make -f make_unix.mak', }, }
  NeoBundle 'Shougo/vimshell.vim'
  NeoBundle 'tsukkee/unite-tag'
""" }

""" Deps {
  if executable('ag')
      NeoBundle 'rking/ag.vim'  " The Silver Searcher
  endif
""" }

call neobundle#end()
syntax on                     " syntax highlighing
filetype plugin indent on     " Required!
NeoBundleCheck

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
  """ change the leader to be a comma vs slash
  let mapleader=","

  """ Edit my vimrc file
  nnoremap <leader>ev :e $MYVIMRC<cr>

  """ Reload Vimrc
  noremap <leader>rv :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<cr>

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
  " map <up> <nop>
  " map <down> <nop>
  " map <left> <nop>
  " map <right> <nop>

  """ Common shortcut
  nmap <C-d> yyp
  nmap <C-x> dd

  """ ctrl-hjkl changes to that split
  noremap <C-h> <C-w>h
  noremap <C-j> <C-w>j
  noremap <C-k> <C-w>k
  noremap <C-l> <C-w>l

  """ Easy window resize
  nnoremap <silent> <C-S-h> <C-w><
  nnoremap <silent> <C-S-j> <C-W>-
  nnoremap <silent> <C-S-k> <C-W>+
  nnoremap <silent> <C-S-l> <C-w>>

  """ Moving per page
  nnoremap <S-j> <PageDown>
  nnoremap <S-k> <PageUp>

  """ Moving to first or last word in line
  nnoremap <S-h> ^
  nnoremap <S-l> $

  """ open/close the quickfix window
  nnoremap <leader>c :copen<cr>
  nnoremap <leader>cc :cclose<cr>

  """ Clear highlight after searching
  nnoremap <silent> <leader>/ :silent :nohlsearch<cr>

  """ New buffer, moving between buffer, close buffer, and list buffer
  nmap <leader>bt :enew<cr>
  nmap <leader>bn :bnext<cr>
  nmap <leader>bp :bprevious<cr>
  nmap <leader>bq :bp <bar> bd #<cr>
  nmap <leader>bl :ls<cr>

  """ Copy to copy-and-paste clipboard
  vnoremap <C-c> "+y

  """ Paste from clipboard
  noremap <C-v> "+p

  """ Changing : into ;
  nnoremap ; :

  """ Very magic for Regex
  noremap / /\v

  """ Auto change directory to match current file
  nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

  """ Fast saves
  nnoremap <leader>w :w!<cr>

  """ Quit window on <leader>q
  nnoremap <leader>q :q<cr>

  """ Execute itself with python2
  " nnoremap <leader>p :w !python2<cr>

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

  set background=dark
  colorscheme Tomorrow-Night-Eighties
  hi DiffText gui=underline guibg=red guifg=black

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
  set colorcolumn=79          " highlight column 79 (where words will wrap)
  set foldenable              " turn on folding
  set splitright              " vsplit to right
  set splitbelow              " split to below

  if &ft == 'css' || &ft == 'sass' || &ft == 'scss'
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
  endif

  if &ft =='md'
      autocmd BufNewFile,BufReadPost *.md set filetype=markdown
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

  """ Backup File
  if isdirectory('/tmp/vim/backupdir') == 0
    :silent !mkdir -p /tmp/vim/backupdir > /dev/null 2>&1
  endif
  set directory=/tmp/vim/backupdir//

  """ Swap File
  if isdirectory($HOME . '/.vim/swap') == 0
    :silent !mkdir -p ~/.vim/swap > /dev/null 2>&1
  endif
  set directory=~/.vim/swap//

  """ Undo File
  if exists("+undofile")
    " undofile - This allows you to use undos after exiting and restarting
    " This, like swap and backups, uses .vim-undo first, then ~/.vim/undo
    " :help undo-persistence
    " This is only present in 7.3+
    if isdirectory($HOME . '/.vim/undo') == 0
      :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
    endif
    set undodir=~/.vim/undo//
    set undofile
  endif
""" }

""" Plugin Setting & Mapping {
  """ Ctags Setting {
    if isdirectory($HOME . '/.vim/tags') == 0
      :silent !mkdir -p ~/.vim/tags > /dev/null 2>&1
    endif
    set tags=./tags;/,~/.vim/tags
  """ }

  """ Easymotion Setting & Mapping {
    let g:EasyMotion_do_mapping = 0
    let g:EasyMotion_smartcase = 1
    nmap f <Plug>(easymotion-s2)
  """ }

  """ Eclim Setting {
    let g:EclimCompletionMethod = 'omnifunc'
  """ }

  """ Gista Setting {
    let g:gista#github_user = 'renodesper'
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
      au FileType go nmap <leader>gr :!go run %<CR>
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

  """ JS Beautify Setting {
    let g:used_javascript_libs = 'jquery'
    autocmd FileType javascript noremap <buffer> <leader>f :%!js-beautify -w 79 -j -q -B -f -<cr>
    autocmd FileType html,php noremap <buffer> <leader>f :%!html-beautify -w 79 -f -<cr>
    autocmd FileType css noremap <buffer> <leader>f :%!css-beautify -f -<cr>
  """ }

  """ NeoComplete Setting {
    let g:acp_enableAtStartup = 0  " Disable AutoComplPop
    let g:neocomplete#enable_at_startup = 1  " Use neocomplete
    let g:neocomplete#enable_smart_case = 1  " Use smartcase
    let g:neocomplete#enable_auto_delimiter = 1
    let g:neocomplete#max_list = 15
    let g:neocomplete#force_overwrite_completefunc = 1

    " Define dictionary
    let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'vimshell' : $HOME.'/.vimshell_hist',
      \ 'scheme' : $HOME.'/.gosh_completions'
      \ }

    " Define keyword
    if !exists('g:neocomplete#keyword_patterns')
      let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    " Enable omni completion
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
    autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

    " Enable heavy omni completion
    if !exists('g:neocomplete#sources#omni#input_patterns')
      let g:neocomplete#sources#omni#input_patterns = {}
    endif
    let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

    """ NeoComplete mapping
    inoremap <expr><C-y> neocomplete#smart_close_popup()
    " <ESC> takes you out of insert mode
    inoremap <expr><Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"
    " <CR>: close popup and save indent
    inoremap <expr><CR> pumvisible() ? neocomplete#close_popup() : "\<CR>"
    " <TAB>: completion
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<TAB>"
    " <BS>: close popup and delete backword char"
    inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
    " Close popup by <Space> and insert <Space>
    inoremap <expr><Space> neocomplete#close_popup() . "\<Space>"
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

  """ Python Setting {
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_trim_whitespaces = 0
    let g:pymode_options = 0
    let g:pymode_rope = 0
  """ }

  """ Sparkup Setting {
    let g:sparkupExecuteMapping = '<leader>e'
  """ }

  """ Syntastic Setting {
    let g:syntastic_javascript_checkers = ['jshint']
    let g:syntastic_python_checkers = ['pylint2']
    let g:syntastic_php_checkers = ['php']
    let g:syntastic_quiet_messages = { "type": "style" }
  """ }

  """ Tabular Mapping {
    if exists(":Tabularize")
      nmap <Leader>a& :Tabularize /&<CR>
      vmap <Leader>a& :Tabularize /&<CR>
      nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
      nmap <Leader>a=> :Tabularize /=><CR>
      vmap <Leader>a=> :Tabularize /=><CR>
      nmap <Leader>a: :Tabularize /:<CR>
      vmap <Leader>a: :Tabularize /:<CR>
      nmap <Leader>a:: :Tabularize /:\zs<CR>
      vmap <Leader>a:: :Tabularize /:\zs<CR>
      nmap <Leader>a, :Tabularize /,<CR>
      vmap <Leader>a, :Tabularize /,<CR>
      nmap <Leader>a,, :Tabularize /,\zs<CR>
      vmap <Leader>a,, :Tabularize /,\zs<CR>
      nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
      vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    endif
  """ }

  """ Tagbar Mapping {
    nnoremap <F3> :TagbarToggle<cr>
    inoremap <F3> <esc>:TagbarToggle<cr>i
  """ }

  """ Trim Whitespace Setting {
    autocmd VimEnter * ToggleStripWhitespaceOnSave
  """ }

  """ Unite Setting & Mapping {
    let g:UltiSnipsExpandTrigger="<leader><Tab>"
    autocmd FileType unite call s:unite_settings()
    function! s:unite_settings()
      imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
      let g:unite_source_history_yank_enable = 1
    endfunction
    call unite#filters#matcher_default#use(['matcher_fuzzy', 'matcher_hide_hidden_files', 'sorter_rank'])

    nnoremap [unite] <Nop>
    nmap <space> [unite]
    nnoremap [unite]f :Unite -start-insert file<cr>
    nnoremap [unite]a :Unite -start-insert file_rec/async<cr>
    nnoremap [unite]t :Unite -start-insert tag<cr>
    nnoremap [unite]g :Unite grep:.<cr>
    nnoremap [unite]h :Unite -quick-match history/yank<cr>
    nnoremap [unite]r :Unite -quick-match file_mru<cr>
    nnoremap [unite]b :Unite -quick-match buffer<cr>
  """ }

  """ Vim CSS3 Syntax Setting {
    augroup VimCSS3Syntax
      autocmd!
      autocmd FileType css setlocal iskeyword+=-
    augroup END
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
    let g:multi_cursor_next_key='<C-n>'
    let g:multi_cursor_prev_key='<C-p>'
    let g:multi_cursor_skip_key='<C-x>'
    let g:multi_cursor_quit_key='<Esc>'
  """ }

  """ Web Setting {
    autocmd FileType html,php,css,sass,scss call WebSetting()
    function! WebSetting()
      set nowrap
    endfunction
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
      autocmd!
      autocmd BufWritePost *.c,*.cpp call s:syntastic()
    augroup END

    function! s:syntastic()
      SyntasticCheck
      call lightline#update()
    endfunction
  """ }
""" }
