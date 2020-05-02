" My NeoVim configuration file
" Author: Rustam Ababakirov, 2019
" Note: Best use with folding (za to toggle folds)
" vim: foldmarker={,} foldmethod=marker foldlevel=10


" PLUGINS {

    "Specify a directory for plugins
    " - For Neovim: ~/.local/share/nvim/plugged
    " - Avoid using standard Vim directory names like 'plugin'
    call plug#begin('~/.local/share/nvim/plugged')

        Plug 'drewtempelmeyer/palenight.vim'
        "Plug 'sainnhe/gruvbox-material'
        "Plug 'joshdick/onedark.vim'
        "Plug 'rakr/vim-one'

        " tmux
        Plug 'christoomey/vim-tmux-navigator'
        Plug 'tmux-plugins/vim-tmux-focus-events'
        Plug 'edkolev/tmuxline.vim'

        "Plug 'lilydjwg/colorizer'
        Plug 'vim-airline/vim-airline'
        "Plug 'vim-airline/vim-airline-themes'

        Plug 'jiangmiao/auto-pairs'

        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim'

        Plug 'mhinz/vim-startify'
        Plug 'scrooloose/nerdcommenter'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'ryanoasis/vim-devicons'
        Plug 'jmcantrell/vim-virtualenv'

        Plug 'junegunn/goyo.vim'

        Plug 'scrooloose/nerdtree'
        "Plug 'Xuyuanp/nerdtree-git-plugin'
        Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

        " Git
        Plug 'tpope/vim-fugitive'
        Plug 'airblade/vim-gitgutter'

        " Syntaxis
        Plug 'tpope/vim-haml'
        Plug 'chr4/nginx.vim'
        Plug 'pangloss/vim-javascript'
        "Plug 'baskerville/vim-sxhkdrc'
        Plug 'tpope/vim-dotenv'

        Plug 'leafgarland/typescript-vim'
        "Plug 'maxmellon/vim-jsx-pretty'

        " python advanced highliting
        Plug 'lepture/vim-jinja'

        " Plug 'wilywampa/vim-ipython', {'branch' : 'update-monitor'}

        Plug 'Guzzii/python-syntax'

        " Асинхронная проверка синтаксиса
        Plug 'w0rp/ale'

        " Use release branch (Recommend)
        Plug 'neoclide/coc.nvim', {'branch': 'release'}

        " post install (yarn install | npm install) then load plugin only for editing supported files
        Plug 'prettier/vim-prettier', {
          \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }


        "Plug 'KabbAmine/zeavim.vim'

        " PHP IDE
        "Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install'}
        "Plug 'StanAngeloff/php.vim'
        "Plug 'rayburgemeestre/phpfolding.vim'
        "Plug 'stephpy/vim-php-cs-fixer'

        " Deoplete ecosystem
        "Plug 'davidhalter/jedi-vim'

        "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        "let g:deoplete#enable_at_startup = 1
        ""Plug 'kristijanhusak/deoplete-phpactor'
        "Plug 'deoplete-plugins/deoplete-jedi'

        "Plug 'SirVer/ultisnips'
        "Plug 'honza/vim-snippets'
        "let g:UltiSnipsUsePythonVersion = 3

        " Plug 'hougo/neosnippet.vim'
        " Plug 'Shougo/neosnippet-snippets'

        "Plug 'nathanaelkane/vim-indent-guides'
        Plug 'Yggdroot/indentLine'

        " Plug 'easymotion/vim-easymotion'

        "Plug 'unblevable/quick-scope'

        Plug 'machakann/vim-highlightedyank'
        "Plug 'vim-scripts/YankRing.vim'
        Plug 'christoomey/vim-system-copy'
        Plug 'liuchengxu/vim-which-key'

        " Dim inactive buffer
        Plug 'TaDaa/vimade'

    " Initialize plugin system
    call plug#end()

" End of plugins section }
" OPTIONS {

    au! FocusLost * VimadeFadeActive
    au! FocusGained * VimadeUnfadeActive

    "let g:python_host_prog='/usr/bin/python'
    "let g:python3_host_prog='/usr/bin/python3'

    set clipboard^=unnamedplus,unnamed
    "set clipboard=unnamed
    set number
    set relativenumber
    set expandtab       " Spaces instead tabs
    set hidden         " Allow buffer switching without saving
    set smartindent

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
    set shortmess=atOI " No help Uganda information, and overwrite read messages to avoid PRESS ENTER prompts
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
    set ruler          " Show the ruler
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


    set colorcolumn=80

    let g:indentLine_char = ''
	" enable indentation
	set breakindent
	" ident by an additional 2 characters on wrapped lines, when line >= 40 characters, put 'showbreak' at start of line
	set breakindentopt=shift:2,min:40,sbr
	" append '>>' to indent
	let &showbreak='↳ '
	set linebreak				" Break by whole words

    " Annoying temporary files
    set directory=/tmp//,.
    set backupdir=/tmp//,.
    if v:version >= 703
        set undodir=/tmp//,.
    endif

    set undofile             " Persistent undo
    set undolevels=1000      " Maximum number of changes that can be undone
    set undoreload=10000     " Maximum number lines to save for undo on a buffer reload


    " let g:golden_ratio_wrap_ignored = 1
	" let g:golden_ratio_exclude_nonmodifiable = 1


    " let g:comfortable_motion_scroll_down_key = "j"
    " let g:comfortable_motion_scroll_up_key = "k"


    "let g:semshi#error_sign	= v:false


    "let g:jedi#goto_command = "<leader>ggd"
    "let g:jedi#goto_assignments_command = "<leader>gg"
    "let g:jedi#goto_definitions_command = ""
    "let g:jedi#documentation_command = "K"
    "let g:jedi#usages_command = "<leader>n"
    "let g:jedi#completions_command = "<C-Space>"
    "let g:jedi#rename_command = "<leader>re"
    "let g:jedi#completions_enabled = 0

    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'
    "
    " FORMATTERS
    au FileType javascript setlocal formatprg=prettier
    au FileType javascript.jsx setlocal formatprg=prettier
    au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
    au FileType html setlocal formatprg=js-beautify\ --type\ html
    au FileType scss setlocal formatprg=prettier\ --parser\ css
    au FileType css setlocal formatprg=prettier\ --parser\ css
" }
" KEYBINDINGS {

    let g:mapleader = "\<Space>"
    " let g:maplocalleader = ','

        " LEADER bindings {

            map <leader>o <Esc>:only<CR>
            map <leader>s <Esc>:Startify<CR>

            autocmd Filetype python nnoremap <buffer> <leader>r :sp <CR> :term python3 % <CR>:startinsert<CR>

            map <leader><leader> <C-^>

            " nmap <leader>t :call fzf#vim#tags(expand('<cword>'))<CR>
            nnoremap <leader>fh <Esc>:History<CR>
            " nmap <leader>b :Buffers<CR>
            nnoremap <leader>ff :Files<CR>
            nnoremap <leader>ft :NERDTreeToggle<CR>
            "nnoremap <leader>ft :Ranger<CR>
            nnoremap <leader>fp :pwd<CR>
            nnoremap <leader>fn :edit <C-R>=expand('%:p:h') . '/'<CR>
            nnoremap <leader>fs :update<CR>
            nnoremap <leader>fc :cd <C-R>=expand('%:p:h') . '/'<CR>


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
            nnoremap <leader>tp :setlocal paste!<CR>

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
            nnoremap <leader>ww <C-W>w
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


            nmap <leader>z <Plug>Zeavim
            vmap <leader>z <Plug>ZVVisSelection
            nmap gz <Plug>ZVOperator
            nmap <leader>Z <Plug>ZVKeyDocset

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

        nmap <F8> :TagbarToggle<CR>

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

    " }

" }
" COLOR SCHEME {
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    set termguicolors

    " Hide ~ sign on end of buffer
    "hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
    set fcs=eob:\ 

    let g:palenight_terminal_italics=1
    let g:onedark_hide_endofbuffer=1
    let g:onedark_terminal_italics=1


    "if (has("autocmd"))
      "augroup colorextend
        "autocmd!
        "" Make `Function`s bold in GUI mode
        "autocmd ColorScheme * call onedark#extend_highlight("Comment", { "gui": "italic" })
        "" Override the `Statement` foreground color in 256-color mode
        "autocmd ColorScheme * call onedark#extend_highlight("Statement", { "fg": { "cterm": 128 } })
        "" Override the `Identifier` background color in GUI mode
        "autocmd ColorScheme * call onedark#extend_highlight("Identifier", { "fg": { "gui": 148 } })
      "augroup END
    "endif

    let g:gruvbox_material_enable_bold = 1
    let g:gruvbox_material_disable_italic_comment = 1

    set background=dark
    let g:airline_theme = 'palenight'
    let g:gruvbox_material_enable_italic = 1
    let g:one_allow_italics = 1

    "colorscheme gruvbox-material
    "colorscheme one
    colorscheme palenight


   " " WARNING: Код ниже меняет цвет активного бэкграунда, при смене темы нужно менять вручную!
    "" Dim inactive window {

        "" Background colors for active vs inactive windows
        "hi InactiveWindow guibg=synIDattr(hlID("Normal"), "bg")
        ""guibg=NONE ctermbg=NONE


        "hi ActiveWindow guibg=#252938

        "" Call method on window enter
        "augroup WindowManagement
            "autocmd!
            "autocmd WinEnter * call Handle_Win_Enter()
            "" autocmd WinEnter * set colorcolumn=80
            "" autocmd WinLeave * set colorcolumn=0
        "augroup END

        "" Change highlight group of active/inactive windows
        "function! Handle_Win_Enter()
            "setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
        "endfunction

    "" }

    " Если нужна прозрачность терминала
     hi! Normal ctermbg=NONE guibg=NONE

" }
" AIRLINE options {

    "let g:airline_theme='onedark'

    let g:airline#extensions#ale#enabled = 1

    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#show_splits = 0
    let g:airline_extensions = ['branch', 'tabline', 'virtualenv']
    "let g:airline_section_b = '%{virtualenv#statusline()}'
    let g:airline#extensions#virtualenv#enabled = 1
    let g:airline_section_c = '%f'
    let g:airline_section_z = '%3p%%  %l/%L  %c'
    let g:airline_left_sep=''
    let g:airline_right_sep=''
    let g:airline#extensions#tabline#buffer_idx_mode = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    " let g:airline#extensions#tabline#fnamemod = ':~'
    let g:airline#extensions#tabline#fnamecollapse = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
    let g:airline#extensions#tabline#left_sep = ''
    let g:airline#extensions#tabline#left_alt_sep = ''
    let g:airline#extensions#tabline#right_sep = ''
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
              \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  " }
  " Startify {

        " Keep sessions persistense
        let g:startify_session_persistence = 1

  " }
" Easymotions mappings {

    " " map  / <Plug>(easymotion-sn)
    " " omap / <Plug>(easymotion-tn)
    " let g:EasyMotion_do_mapping = 0 " Disable default mappings

    " " Jump to anywhere you want with minimal keystrokes, with just one key binding.
    " " `s{char}{label}`
    " nmap f <Plug>(easymotion-overwin-f)
    " nmap s <Plug>(easymotion-overwin-f2)
    " nmap F <Plug>(easymotion-overwin-w)

    " " Turn on case insensitive feature
    " let g:EasyMotion_smartcase = 1

    " " JK motions: Line motions
    " map <leader>ej <Plug>(easymotion-j)
    " map <leader>ek <Plug>(easymotion-k)

    " " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
    " " Without these mappings, `n` & `N` works fine. (These mappings just provide
    " " different highlight method and have some other features )
    " " map  n <Plug>(easymotion-next)
    " " map  N <Plug>(easymotion-prev)

" }
" TagBar {

    let g:tagbar_phpctags_bin='phpctags'

    let g:tagbar_type_css = {
                \ 'ctagstype' : 'Css',
                \ 'kinds'     : [
                \ 'c:classes',
                \ 's:selectors',
                \ 'i:identities'
                \ ]
                \ }
    let g:tagbar_type_ansible = {
                \ 'ctagstype' : 'ansible',
                \ 'kinds' : [
                \ 't:tasks'
                \ ],
                \ 'sort' : 0
                \ }
    let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
            \ 'h:Heading_L1',
            \ 'i:Heading_L2',
            \ 'k:Heading_L3'
        \ ]
    \ }

    function! StartifyEntryFormat()
        return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
    endfunction

" }
" Gutentags module options {

    " let g:gutentags_modules = ['ctags', 'gtags_cscope']

    " " config project root markers.
    " let g:gutentags_project_root = ['.root']

    " " generate datebases in my cache directory, prevent gtags files polluting my project
    " let g:gutentags_cache_dir = expand('~/.cache/tags')

    " " change focus to quickfix window after search (optional).
    " let g:gutentags_plus_switch = 1
    " let g:gutentags_plus_nomap = 1

    " noremap <silent> <leader>ts :GscopeFind s <C-R><C-W><cr>
    " noremap <silent> <leader>tg :GscopeFind g <C-R><C-W><cr>
    " noremap <silent> <leader>tc :GscopeFind c <C-R><C-W><cr>
    " noremap <silent> <leader>tt :GscopeFind t <C-R><C-W><cr>
    " noremap <silent> <leader>te :GscopeFind e <C-R><C-W><cr>
    " noremap <silent> <leader>tf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
    " noremap <silent> <leader>ti :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
    " noremap <silent> <leader>td :GscopeFind d <C-R><C-W><cr>
    " noremap <silent> <leader>ta :GscopeFind a <C-R><C-W><cr>

" }
"" PHP Actor bindings {

    ""  Include use statement
    "nmap <leader>pu :call phpactor#UseAdd()<CR>

    "" Invoke the context menu
    "nmap <leader>pm :call phpactor#ContextMenu()<CR>

    "" Invoke the navigation menu
    "nmap <leader>pn :call phpactor#Navigate()<CR>

    "" Goto definition of class or class member under the cursor
    "nmap <leader>pd  :call phpactor#GotoDefinition()<CR>
    "nmap <leader>gd  :call phpactor#GotoDefinition()<CR>

    "" Show brief information about the symbol under the cursor
    "nmap <leader>ph :call phpactor#Hover()<CR>

    "" Transform the classes in the current file
    "nmap <leader>pt :call phpactor#Transform()<CR>

    "" Generate a new class (replacing the current file)
    "nmap <leader>pc :call phpactor#ClassNew()<CR>

    "" Extract expression (normal mode)
    "nmap <silent><leader>pe :call phpactor#ExtractExpression(v:false)<CR>

    "" Extract expression from selection
    "vmap <silent><leader>pe :<C-U>call phpactor#ExtractExpression(v:true)<CR>

    "" Extract method from selection
    "vmap <silent><leader>px :<C-U>call phpactor#ExtractMethod()<CR>

""}
" Ale signs and options {

    let g:ale_sign_error = ' '
    let g:ale_sign_warning = ' '
    " let g:ale_lint_delay = '5000'

	"	disable linting while typing
	let g:ale_lint_on_text_changed = 'never'
	let g:ale_lint_on_enter = 0
	let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
	let g:ale_open_list = 1
	let g:ale_keep_list_window_open=0
	let g:ale_set_quickfix=0
	let g:ale_list_window_size = 5
	let g:ale_php_phpcbf_standard='PSR2'
	let g:ale_php_phpcs_standard='phpcs.xml.dist'
	let g:ale_php_phpmd_ruleset='phpmd.xml'
	let g:ale_fixers = {
				\ '*': ['remove_trailing_lines'],
				\ 'php': ['phpcbf', 'php_cs_fixer', 'remove_trailing_lines', 'trim_whitespace'],
                \ 'python' : [
                    \   'remove_trailing_lines',
                    \   'add_blank_lines_for_python_control_statements',
                    \   'trim_whitespace',
                    \   'isort',
                    \   'autopep8',
                \],
                \    'javascript': ['prettier','eslint'],
                \    'typescript': ['prettier', 'tslint'],
                \    'vue': ['eslint'],
                \    'scss': ['prettier'],
                \    'html': ['prettier'],
                \    'reason': ['refmt']				
            \}
    let g:ale_linters = {
	\   'python': ['flake8'],
    \   'javascript': ['eslint'],
    \   'vue': ['eslint']
	\}
	let g:ale_fix_on_save = 1

" }
" coc.nvim configuration {

    " TextEdit might fail if hidden is not set.
    set hidden

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

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
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
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
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)

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


" }
" Save folds view and load them Automatically {

    " set viewdir=$HOME/.config/nvim/view//
    " augroup AutoSaveFolds
    "     autocmd!
		" au BufWinLeave ?* silent! mkview 1
		" au BufWinEnter ?* silent! loadview 1
    " augroup END

    " Autoload Nerdtree on vim start and send cursor to other window
    " autocmd VimEnter * NERDTree | wincmd p

"}
