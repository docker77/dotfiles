" My NeoVim configuration file
" Author: Rustam Ababakirov, 2019-2020
" Note: Best use with folding (za to toggle folds)
" vim: foldmarker={,} foldmethod=marker foldlevel=10


" PLUGINS {

    " - For Neovim: ~/.local/share/nvim/plugged
    call plug#begin('~/.local/share/nvim/plugged')

        Plug 'drewtempelmeyer/palenight.vim'

        " tmux
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'tmux-plugins/vim-tmux-focus-events'
        Plug 'edkolev/tmuxline.vim'

        Plug 'vim-airline/vim-airline'

        Plug 'jiangmiao/auto-pairs'

        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'
        autocmd! FileType fzf tnoremap <buffer> <esc> <c-c>

        Plug 'mhinz/vim-startify'
        Plug 'scrooloose/nerdcommenter'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'ryanoasis/vim-devicons'
        Plug 'jmcantrell/vim-virtualenv'
        Plug 'airblade/vim-rooter'

        Plug 'junegunn/goyo.vim'

        " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'
        Plug 'APZelos/blamer.nvim'

        " Syntaxis
        Plug 'tpope/vim-haml'
        Plug 'pangloss/vim-javascript'
        Plug 'tpope/vim-dotenv'

        Plug 'leafgarland/typescript-vim'
        Plug 'maxmellon/vim-jsx-pretty'

        Plug 'Guzzii/python-syntax'

        " Асинхронная проверка синтаксиса
        "Plug 'w0rp/ale'

        " Use release branch (Recommend)
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " post install (yarn install | npm install) then load plugin only for editing supported files
        Plug 'prettier/vim-prettier', {
          \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
        let g:prettier#config#tab_width =2 

        Plug 'mattn/emmet-vim'
        Plug 'honza/vim-snippets'
        Plug 'epilande/vim-react-snippets'

        "Plug 'Yggdroot/indentLine'

        Plug 'unblevable/quick-scope'
        let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
        Plug 'justinmk/vim-sneak'

        Plug 'machakann/vim-highlightedyank'
        "Plug 'christoomey/vim-system-copy'
        Plug 'liuchengxu/vim-which-key'

        " Dim inactive buffer
        "Plug 'TaDaa/vimade'

        "Plug 'godlygeek/tabular'
        "Plug 'plasticboy/vim-markdown'

        Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug', 'vimwiki']}
        Plug 'vimwiki/vimwiki'
    " Initialize plugin system
    call plug#end()

" End of plugins section }
" OPTIONS {

    "let g:python_host_prog='/usr/bin/python'
    "let g:python3_host_prog='/usr/bin/python3'

    set noshowmode  " to get rid of thing like --INSERT--
    set noshowcmd  " to get rid of display of last command
    set noruler
    "set clipboard^=unnamedplus,unnamed

    "// WSL workaround for clipboard yank working
    set clipboard+=unnamedplus

   if has('wsl')
       let g:clipboard = {
                 \   'name': 'wslclipboard',
                 \   'copy': {
                 \      '+': '/path/to/win32yank.exe -i --crlf',
                 \      '*': '/path/to/win32yank.exe -i --crlf',
                 \    
       },
                   \   'paste': {
                 \      '+': '/path/to/win32yank.exe -o --lf',
                 \      '*': '/path/to/win32yank.exe -o --lf',
                 \   
       },
                 \   'cache_enabled': 1,
                 \ 
       }
   endif
    "set clipboard=unnamed
    set number
    set relativenumber
    set expandtab       " Spaces instead tabs
    set hidden         " Allow buffer switching without saving
    set smartindent
    set cmdheight=1
    " Get a lot from https://github.com/liuchengxu/vim-better-default/blob/master/plugin/default.vim

    set nocompatible

    syntax on                      " Syntax highlighting
    filetype plugin indent on      " Automatically detect file types
    set autoindent                 " Indent at the same level of the previous line
    set autoread                   " Automatically read a file changed outside of vim
    set backspace=indent,eol,start " Backspace for dummies
    set display=lastline           " Show as much as possible of the last line
    set encoding=utf-8             " Set default encoding
    set history=10000              " Maximum history record
    set hlsearch                   " Highlight search terms
    set incsearch                  " Find as you type search
    set mouse=a                    " Automatically enable mouse usage
    set smarttab                   " Smart tab
    set ttyfast                    " Faster redrawing
    set viminfo+=!                 " Viminfo include !
    set wildmenu                   " Show list instead of just completing

    set iskeyword=@,48-57,_,192-255     " Навигация с учетом русских символов, учитывается командами следующее/предыдущее слово и т.п.
    set shortmess=atOIF " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
    set ignorecase     " Case insensitive search
    set smartcase      " ... but case sensitive when uc present
    set scrolloff=3    " Minumum lines to keep above and below cursor
    set nowrap         " Do not wrap long lines
    set shiftwidth=4   " Use indents of 4 spaces
    set tabstop=4      " An indentation every four columns
    set softtabstop=4  " Let backspace delete indent
    set splitright     " Puts new vsplit windows to the right of the current
    set splitbelow     " Puts new split windows to the bottom of the current
    " set autowrite      " Automatically write a file when leaving a modified buffer
    set mousehide      " Hide the mouse cursor while typing
    "set ruler          " Show the ruler
    set showcmd        " Show partial commands in status line and Selected characters/lines in visual mode
    set showmatch      " Show matching brackets/parentthesis
    set matchtime=5    " Show matching time
    set report=0       " Always report changed lines
    "set linespace=0    " No extra spaces between rows
    set pumheight=20   " Avoid the pop up menu occupying the whole screen

    set foldenable      " Folding
    "set foldmarker={,}
    set foldlevel=99
    set foldmethod=indent
    " set foldcolumn=3
    set foldlevelstart=99
    set fillchars=fold:


    "set colorcolumn=80

    "let g:indentLine_char = ''
	"" enable indentation
    set breakindent
	"" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
	"set breakindentopt=shift:2,min:40,sbr
	"" append '>>' to indent
	"let &showbreak='↳ '
    set linebreak				" Break by whole words
    ""let g:indentLine_setConceal = 0
    "let g:indentLine_concealcursor = 'c'

    " Annoying temporary files
    set directory=/tmp//,.
    set backupdir=/tmp//,.
    if v:version >= 703
        set undodir=/tmp//,.
    endif

    set undofile             " Persistent undo
    set undolevels=1000      " Maximum number of changes that can be undone
    set undoreload=10000     " Maximum number lines to save for undo on a buffer reload



    let g:netrw_browsex_viewer="cmd.exe /C start %" 

    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
    let $FZF_DEFAULT_OPTS='--height 40% --inline-info'


    au BufNewFile,BufRead *.ts setlocal filetype=typescriptreact
    au BufNewFile,BufRead *.js setlocal filetype=javascriptreact
    autocmd BufRead,BufNewFile *.jsx setlocal filetype=javascriptreact.javascript.javascript-react.javascript_react
    autocmd BufRead,BufNewFile *.tsx setlocal filetype=typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react
    " FORMATTERS
    au FileType javascript setlocal formatprg=prettier ts=2 sts=2 sw=2
    au FileType javascript.jsx setlocal formatprg=prettier ts=2 sts=2 sw=2
    au FileType typescript setlocal  ts=2 sts=2 sw=2 formatprg=prettier\ --parser\ typescript
    au FileType html setlocal formatprg=js-beautify\ --type\ html
    au FileType scss setlocal formatprg=prettier\ --parser\ css
    au FileType css setlocal formatprg=prettier\ --parser\ css

    let g:vimwiki_global_ext = 0
    let wiki_1 = {}
    let wiki_1.path = '~/vimwiki/'
    let wiki_1.syntax = 'markdown'
    let wiki_1.ext = '.md'

    let g:vimwiki_list = [wiki_1]
    let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    let g:vimwiki_listsyms = ' ○◐●X'
    let g:vimwiki_table_mappings = 0

    "let g:vimwiki_conceallevel = 0
    "let g:vimwiki_conceal_pre = 1

    "let g:vimwiki_url_maxsave = 0
    setlocal concealcursor=c 


    let g:blamer_enabled = 1
    let g:blamer_show_in_visual_modes = 0
    let g:blamer_show_in_insert_modes = 0
    let g:blamer_prefix = ' > '
    highlight link Blamer NonText
    "highlight Blamer guifg=#3e445c
    
    
"}
" KEYBINDINGS {

    " so I can go up an down wrapped lines
    "map j gj
    "map k gk

    let g:mapleader = "\<Space>"
    " let g:maplocalleader = ','

        " LEADER bindings {
            nmap <C-_>   <Plug>NERDCommenterToggle
            vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

            map <leader>o <Esc>:only<CR>
            map <leader>s <Esc>:Startify<CR>
            map <leader>m <Esc>:MarkdownPreview<CR>
            map <leader>mm <Esc>:MarkdownPreviewStop<CR>

            autocmd Filetype python nnoremap <buffer> <leader>r :sp <CR> :term python3 % <CR>:startinsert<CR>

            map <leader><leader> <C-^>

            " nmap <leader>t :call fzf#vim#tags(expand('<cword>'))<CR>
            "nnoremap <leader>fh <Esc>:History<CR>
            "nnoremap <leader>fl :Lines<CR>
            "nnoremap <leader>ff :Files<CR>
            "nnoremap <leader>fp :pwd<CR>
            "nnoremap <leader>fn :edit <C-R>=expand('%:p:h') . '/'<CR>
            "nnoremap <leader>fs :update<CR>
            "nnoremap <leader>fc :cd <C-R>=expand('%:p:h') . '/'<CR>


            nnoremap <Leader>fh     :<C-u>CocCommand fzf-preview.MruFiles<CR>
            nnoremap <Leader>ff     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
            nnoremap <Leader>fgs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
            nnoremap <Leader>fga    :<C-u>CocCommand fzf-preview.GitActions<CR>
            nnoremap <Leader>fb     :<C-u>CocCommand fzf-preview.Buffers<CR>
            nnoremap <Leader>fB     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
            nnoremap <Leader>fo     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
            nnoremap <Leader>fj     :<C-u>CocCommand fzf-preview.Jumps<CR>
            nnoremap <Leader>fg;    :<C-u>CocCommand fzf-preview.Changes<CR>
            nnoremap <Leader>f/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
            nnoremap <Leader>f*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
            nnoremap <Leader>fgr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
            xnoremap <Leader>fgr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
            "nnoremap <Leader>ft     :<C-u>CocCommand fzf-preview.BufferTags<CR>
            nnoremap <Leader>fq     :<C-u>CocCommand fzf-preview.QuickFix<CR>
            nnoremap <Leader>fl     :<C-u>CocCommand fzf-preview.LocationList<CR>

            nnoremap <leader>go :Goyo<CR>
            " Quit normal mode
            nnoremap <silent> <leader>q  :q<CR>
            nnoremap <leader>Q  :qa!<CR>
            " Move half page faster
            " nnoremap <leader>d  :call comfortable_motion#flick(100)<CR>
            " nnoremap <leader>u  :call comfortable_motion#flick(-100)<CR>
            nnoremap <leader>d  <C-d>
            nnoremap <leader>u  <C-u>

            " Search result highlight countermand
            nnoremap <leader>th :nohlsearch<CR>
            " Toggle pastemode
            "nnoremap <leader>tp :setlocal paste!<CR>

            " Toggle wrap
            nnoremap <leader>tw :set wrap!<CR>

            "nnoremap <leader>tc :HexokinaseToggle<CR>

            "Buffer mappings
            nnoremap <leader>bp :bprevious<CR>
            nnoremap <leader>bn :bnext<CR>
            nnoremap <leader>bf :bfirst<CR>
            nnoremap <leader>bl :blast<CR>
            nnoremap <leader>bd :bd<CR>
            nnoremap <leader>bc :bd<CR>
            nnoremap <leader>bk :bd!<CR>
            nnoremap <leader>bw :bw<CR>

            map <leader>` :split<CR>:resize 20<CR>:terminal<CR>i

            :tnoremap <Esc> <C-\><C-n>

            " Fold
            nnoremap <leader>f0 :set foldlevel=0<CR>
            nnoremap <leader>f1 :set foldlevel=1<CR>
            nnoremap <leader>f2 :set foldlevel=2<CR>
            nnoremap <leader>f3 :set foldlevel=3<CR>
            "

            " Window
            "nnoremap <leader>ww <C-W>w
            nnoremap <leader>wr <C-W>r
            nnoremap <leader>wd <C-W>c
            nnoremap <leader>wc <C-W>c
            nnoremap <leader>wq <C-W>q
            nnoremap <leader>wj <C-W>j
            nnoremap <leader>wk <C-W>k
            nnoremap <leader>wh <C-W>h
            nnoremap <leader>wl <C-W>l
            if has('nvim') || has('terminal')
                tnoremap <leader>wj <C-W>j
                tnoremap <leader>wk <C-W>k
                tnoremap <leader>wh <C-W>h
                tnoremap <leader>wl <C-W>l
            endif
            nnoremap <leader>wH <C-W>5<
            nnoremap <leader>wL <C-W>5>
            nnoremap <leader>wJ :resize +5<CR>
            nnoremap <leader>wK :resize -5<CR>
            nnoremap <leader>w= <C-W>=
            nnoremap <leader>ws <C-W>s
            nnoremap <leader>w- <C-W>s
            nnoremap <leader>- <C-W>s
            nnoremap <leader>wv <C-W>v
            nnoremap <leader>\ <C-W>v
            nnoremap <leader>w\ <C-W>v
            nnoremap <leader>w2 <C-W>v

            " Search grep
            nnoremap <silent> <leader>fa :Ag<CR>
            nnoremap <silent> <leader>faa :Ag <C-R><C-W><CR>
            nnoremap <silent> <leader>fr :Rg<CR>
            nnoremap <silent> <leader>frr :Rg <C-R><C-W><CR>

            " Python auto format code
            autocmd FileType python nnoremap <Leader>= :0,$!yapf<CR>


        " }
        " LOCALLEADER bindings {

            " <Localleader>e -- Edit file, starting in same directory as current file.
            " nnoremap <Localleader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

            " " <leader>p -- Show the path of the current file (mnemonic: path; useful when
            " " you have a lot of splits and the status line gets truncated).
            " " nnoremap <leader>p :echo expand('%')<CR>
            " nnoremap <Localleader>c :cd <C-R>=expand('%:p:h') . '/'<CR>

            " map <Localleader>z <Esc>:Goyo<CR>
            " autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>

        " }
" OTHER Bindings {

        " Insert mode shortcut
        inoremap <C-h> <BS>
        inoremap <C-j> <Down>
        inoremap <C-k> <Up>
        inoremap <C-b> <Left>
        inoremap <C-f> <Right>

        " Bash like
        inoremap <C-a> <Home>
        inoremap <C-e> <End>
        inoremap <C-d> <Delete>

        " Command mode shortcut
        cnoremap <C-h> <BS>
        cnoremap <C-j> <Down>
        cnoremap <C-k> <Up>
        cnoremap <C-b> <Left>
        cnoremap <C-f> <Right>
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
        cnoremap <C-d> <Delete>

        " jj | escaping
        " inoremap jj <Esc>
        " cnoremap jj <C-c>
        " Quit visual mode
        vnoremap v <Esc>
        " Move to the start of line
        nnoremap H ^
        " Move to the end of line
        nnoremap L $
        " Redo
        nnoremap U <C-r>
        " Quick command mode
        " nnoremap <CR> :
        " In the quickfix window, <CR> is used to jump to the error under the
        " cursor, so undefine the mapping there.
        autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
        " Yank to the end of line
        nnoremap Y y$
        " Auto indent pasted text
        "nnoremap p p=`]<C-o>

        " Toggle fold at current position.
        " nmap <Tab> za

        noremap <Up> <Nop>
        noremap <Down> <Nop>
        noremap <Left> <Nop>
        noremap <Right> <Nop>

        " sudo write
        cmap w!! w !sudo tee % >/dev/null

        " Easy window navigation
        map <C-h> <C-w>h
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l

        " Escape from terminal mode in terminal
        tnoremap <S-Esc> <C-\><C-n>

        nnoremap <A-j> :m .+1<CR>==
        nnoremap <A-k> :m .-2<CR>==
        inoremap <A-j> <Esc>:m .+1<CR>==gi
        inoremap <A-k> <Esc>:m .-2<CR>==gi
        vnoremap <A-j> :m '>+1<CR>gv=gv
        vnoremap <A-k> :m '<-2<CR>gv=gv
" }

" }
" COLOR SCHEME {
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors

    " Hide ~ sign on end of buffer
    "hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
    set fcs=eob:\ 

    let g:palenight_terminal_italics=1
    let g:palenight_terminal_bold=1

    set background=dark

    colorscheme palenight
    "colorscheme palenight

    " Если нужна прозрачность терминала
     hi! Normal ctermbg=NONE guibg=NONE


" }
" AIRLINE options {

    let g:airline_theme = 'palenight'
    "let g:airline#extensions#ale#enabled = 1

    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline_extensions = ['branch', 'virtualenv']
    "let g:airline_extensions = ['branch', 'tabline', 'virtualenv']
    "let g:airline_section_b = '%{virtualenv#statusline()}'
    let g:airline#extensions#virtualenv#enabled = 1
    let g:airline_section_c = '%f %m'
    let g:airline_section_z = '%3p%%  %l/%L  %c'
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    " let g:airline#extensions#tabline#fnamemod = ':~'
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#left_sep = '|'
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = '|'
    let g:airline#extensions#tabline#right_alt_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline#extensions#tabline#buffer_idx_mode = 1

    nmap <leader>1 <Plug>AirlineSelectTab1
    nmap <leader>2 <Plug>AirlineSelectTab2
    nmap <leader>3 <Plug>AirlineSelectTab3
    nmap <leader>4 <Plug>AirlineSelectTab4
    nmap <leader>5 <Plug>AirlineSelectTab5
    nmap <leader>6 <Plug>AirlineSelectTab6
    nmap <leader>7 <Plug>AirlineSelectTab7
    nmap <leader>8 <Plug>AirlineSelectTab8
    nmap <leader>9 <Plug>AirlineSelectTab9
    " nmap <leader>- <Plug>AirlineSelectPrevTab
    " nmap <leader>+ <Plug>AirlineSelectNextTab


"}
" Which_Key options {
  set timeoutlen=500
  let g:which_key_vertical = 0

  " DICTIONARY OF MAPPINGS {
  " Define prefix dictionary
  let g:which_key_map =  {}

  let g:which_key_map['f']  = {
              \ 'name' : '+ Find/Files/Folders',
              \ '0' :  'Folder Level 0',
              \ '1' :  'Folder Level 1',
              \ '2' :  'Folder Level 2',
              \ '3' :  'Folder Level 3',
              \ 'a' :  'Ag - Find in files',
              \ 'aa' :  'Ag - text under cursor',
              \ 'r' :  'Rg - Find in files',
              \ 'rr' :  'Rg - text under cursor',
              \ 's' :  'File Save',
              \ 'h' :  'File History',
              \ 'n' :  'New file in same directory',
              \ 'c' :  'CD (change root dir)',
              \ 'p' :  'PWD (show root dir)',
              \ }
  let g:which_key_map['w']  = {
              \ 'name' : '+ Windows',
              \ 'w' :  'other window',
              \ 'd' :  'delete window',
              \ '-' :  'split window below',
              \ '|' :  'split window right',
              \ '2' :  'layout double columns',
              \ 'o' :  ['only', 'close all windows except current'] ,
              \ 'h' :  'window left',
              \ 'j' :  'window below',
              \ 'l' :  'window right',
              \ 'k' :  'window up',
              \ 'H' :  'expand window left',
              \ 'J' :  'expand window below',
              \ 'L' :  'expand window right',
              \ 'K' :  'expand window up',
              \ '=' :  'balance window',
              \ 's' :  'split window below',
              \ 'v' :  'split window below',
              \ }
  "let g:which_key_map['p']  = {
              "\ 'name' : '+ Projects/PHP',
              "\ }
  "let g:which_key_map['p']['c']  = {
              "\ 'name' : '+ PHP CS Fixer',
              "\ }
  " let g:which_key_map['e']  = {
  "             \ 'name' : '+ EasyMotion',
  "             \ 'j' :  'To line down',
  "             \ 'k' :  'To line upward',
  "             \ }
  let g:which_key_map['t']  = {
              \ 'name' : '+ Toggle/Tags',
              \ 'p' :  'Toggle Paste Mode',
              \ 'w' :  'Toggle Wrap',
              \ 'h' :  'Toggle Highlight (:nohlsearch)',
              \ 's' :  'GTags Find symbol (reference) under cursor',
              \ 'g' :  'GTags Find symbol definition under cursor',
              \ 'd' :  'GTags Functions called by this function   ',
              \ 'c' :  'GTags Functions calling this function',
              \ 't' :  'GTags Find text string under cursor',
              \ 'e' :  'GTags Find egrep pattern under cursor',
              \ 'f' :  'GTags Find file name under cursor',
              \ 'i' :  'GTags Find files #including the file name under cursor',
              \ 'a' :  'GTags Find places where current symbol is assigned',
              \ }
  let g:which_key_map['b']  = {
              \ 'name' : '+ Buffers',
              \ }
  let g:which_key_map['g']  = {
              \ 'name' : '+ Goto/Git',
              \ 'd' : 'Goto Definition',
              \ }
  let g:which_key_map['h']  = {
              \ 'name' : '+ History/Hunk',
              \ }

  " Leader with 1 char mappings
  for s:i in range(1, 9)
      let g:which_key_map[s:i] = 'Buf tab '.s:i
  endfor
  unlet s:i
  let g:which_key_map['-'] = '- Horizontal split'
  let g:which_key_map[' '] = 'Previous file'
  let g:which_key_map['\'] = '| Vertical split'
  let g:which_key_map['o'] = 'Only window'
  let g:which_key_map['d'] = 'Half page Down'
  let g:which_key_map['u'] = 'Half page Up'
  let g:which_key_map["'"] = 'Terminal'
  " }

  call which_key#register('<Space>', "g:which_key_map")
  nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
  vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
  nnoremap <silent> <Localleader> :<c-u>WhichKey  ','<CR>

  autocmd! FileType which_key
  autocmd  FileType which_key set laststatus=0 noshowmode noruler
              \| autocmd BufLeave <buffer> set laststatus=2 noshowmode noruler

" }
" Startify {

    " Keep sessions persistense
    let g:startify_session_persistence = 1
    " returns all modified files of the current git repo
    " `2>/dev/null` makes the command fail quietly, so that when we are not
    " in a git repo, the list will be empty
    function! s:gitModified()
        let files = systemlist('git ls-files -m 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction

    " same as above, but show untracked files, honouring .gitignore
    function! s:gitUntracked()
        let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
        return map(files, "{'line': v:val, 'path': v:val}")
    endfunction

    let g:startify_lists = [
                \ { 'type': 'files',     'header': ['   MRU']            },
                \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
                \ { 'type': 'sessions',  'header': ['   Sessions']       },
                \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
                \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
                \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
                \ { 'type': 'commands',  'header': ['   Commands']       },
                \ ]

" }
" coc.nvim configuration {
    let g:coc_filetype_map = {
          \ '': 'html',
          \ 'javascriptreact.javascript.javascript-react.javascript_react': 'javascriptreact',
          \ 'typescriptreact.javascript.typescript.javascriptreact.javascript-react.javascript_react': 'typescriptreact'
          \ }

    let g:coc_global_extensions = ['coc-python','coc-tslint-plugin', 'coc-tsserver', 'coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-yank', 'coc-prettier', 'coc-explorer', 'coc-snippets']
    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    "set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    if has('patch8.1.1068')
      " Use `complete_info` if your (Neo)Vim version supports it.
      inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
      imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    "nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
    nmap <silent> gy <Plug>(coc-type-definition)
    "nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code.
    xmap <C-f>  <Plug>(coc-format-selected)
    nmap <C-f>  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json,md setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current line.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    "nmap <silent> <TAB> <Plug>(coc-range-select)
    "xmap <silent> <TAB> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

    " Add `:Fold` command to fold current buffer.
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support.
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline.
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings using CoCList:
    " Show all diagnostics.
    nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

    nmap <space>ft :CocCommand explorer<CR>
    "nmap <space>fb :CocCommand explorer --sources=buffer+<CR>

    nmap <space>ef :CocCommand explorer --preset floating<CR>

    let g:coc_explorer_global_presets = {
                \   '.vim': {
                \      'root-uri': '~/.vim',
                \   },
                \   'floating': {
                \      'position': 'floating',
                \   },
                \   'floatingLeftside': {
                \      'position': 'floating',
                \      'floating-position': 'left-center',
                \      'floating-width': 50,
                \   },
                \   'floatingRightside': {
                \      'position': 'floating',
                \      'floating-position': 'left-center',
                \      'floating-width': 50,
                \   },
                \   'simplify': {
                \     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                \   }
                \ }

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    " Use <C-j> for select text for visual placeholder of snippet.
    vmap <C-j> <Plug>(coc-snippets-select)

    " Use <C-j> for jump to next placeholder, it's default of coc.nvim
    let g:coc_snippet_next = '<c-j>'

    " Use <C-k> for jump to previous placeholder, it's default of coc.nvim
    let g:coc_snippet_prev = '<c-k>'

    " Use <C-j> for both expand and jump (make expand higher priority.)
    imap <C-j> <Plug>(coc-snippets-expand-jump)
" }
" Sneak movement options {
    let g:sneak#label = 1

    " case insensitive sneak
    let g:sneak#use_ic_scs = 1

    " immediately move to the next instance of search, if you move the cursor sneak is back to default behavior
    let g:sneak#s_next = 1

    " remap so I can use , and ; with f and t
    map gS <Plug>Sneak_,
    map gs <Plug>Sneak_;

    " Change the colors
    highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
    highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

    " Cool prompts
    " let g:sneak#prompt = '🕵'
     let g:sneak#prompt = '🔎'

    " I like quickscope better for this since it keeps me in the scope of a single line
     "map f <Plug>Sneak_f
     "map F <Plug>Sneak_F
    " map t <Plug>Sneak_t
    " map T <Plug>Sneak_T
"}
" FZF config {
    " This is the default extra key bindings
    let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    " An action can be a reference to a function that processes selected lines
    function! s:build_quickfix_list(lines)
      call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
      copen
      cc
    endfunction

    let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

    " Default fzf layout
    " - Popup window
    "let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

    " - down / up / left / right
    let g:fzf_layout = { 'down': '40%' }

    " - Window using a Vim command
    "let g:fzf_layout = { 'window': 'enew' }
    "let g:fzf_layout = { 'window': '-tabnew' }
    "let g:fzf_layout = { 'window': '10new' }

    " Customize fzf colors to match your color scheme
    " - fzf#wrap translates this to a set of `--color` options
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

    " Enable per-command history
    " - History files will be stored in the specified directory
    " - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
    "   'previous-history' instead of 'down' and 'up'.
    let g:fzf_history_dir = '~/.local/share/fzf-history'
"}
