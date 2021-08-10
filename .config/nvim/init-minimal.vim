"   +--------------------------------------------------+
"  |                     PLUGINS                      |
"  +--------------------------------------------------+
" {{{
filetype off 
let nvim_path = '~/.config/nvim/'
call plug#begin(nvim_path . 'bundle')
" Connecting with external software
Plug 'junegunn/fzf.vim'                                                 " fzf 
Plug 'junegunn/fzf'                                                     " fzf 
" Vim nicities & features
Plug 'tpope/vim-repeat'                                                 " repeat things with . operator
Plug 'michaeljsmith/vim-indent-object', {'for': 'python'}               " indent object, mainly for python
Plug 'tpope/vim-surround'                                               " surround text
Plug 'terryma/vim-multiple-cursors'                                     " multi-cursor
Plug 'scrooloose/nerdcommenter'                                         " easy text commenting
Plug 'godlygeek/tabular'                                                " tabular: align on character
Plug 'rstacruz/vim-closer'                                              " auto pairs
" Pretty things
Plug 'luochen1990/rainbow'                                              " rainbow parentheses
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Language packs
Plug 'plasticboy/vim-markdown'
Plug 'andys8/vim-elm-syntax', {'for': 'elm'}                            " elm support
Plug 'cespare/vim-toml', {'for': 'toml'}                                " toml support
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}                    " Better Haskell syntax highlighting

call plug#end()
filetype plugin indent on
syntax enable

"}}}

"  +--------------------------------------------------+
"  |                     SETTINGS                     |
"  +--------------------------------------------------+
"  {{{
set backspace=indent,eol,start      " allows backspace to delete across lines
set clipboard+=unnamedplus          " use system clipboard
set cmdheight=1                     " allows an extra row for coc.nvim and stuff
set encoding=utf-8                  " set encoding to be utf-8
set expandtab                       " expands tabs into spaces
set hidden                          " don't have to write changes to change buffer
set ignorecase smartcase            " case insensitive searches
set incsearch nohls                 " incremental search for / and whatnot
set mouse=a                         " always allows mouse usage
set nobackup                        " no backup file
set noswapfile                      " disables swapfiles and backup files
set nowrap                          " no line wrapping
set relativenumber number           " relative and absolute numbers
set rtp +=~/.config/nvim/ftdetect   " adds filetype detection folder to rtp
set shell=zsh                       " shell is zsh
set shiftwidth=4                    " indentation adds 4 spaces
set signcolumn=yes                  " always show signcolumn
set softtabstop=4                   " not sure what this does
set splitbelow splitright          " split creates buffer below instead of above
set tabstop=4                       " tabs turn into 4 spaces
set textwidth=100                   " max columns
set updatetime=300                  " faster update time for coc.nvim
set cursorline                      " highlights current row
set ff=unix                         " file format is unix (\n vs \r\n)
set foldmethod=marker               " use {{{, }}} as fold markers
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case " use rg instead of grep
set inccommand=nosplit              " shows changes in real time
set lazyredraw                      " do not redraw in the middle of a command
set undodir=~/.config/nvim/undo-dir " undir tree and undo dir
set undofile                        " undofile
set conceallevel=2                  " conceal concealable characters, i.e. in markdown
let g:spellfile_url = 'http://ftp.vim.org/vim/runtime/spell'
let g:tex_flavor = "latex"
set wildignorecase
"}}}

"  +--------------------------------------------------+
"  |                    APPEARANCE                    |
"  +--------------------------------------------------+
"{{{
set termguicolors
set background=dark
colorscheme material
" set comments to be italics
set t_ZH=[3m
set t_ZR=[23m
highlight Comment cterm=italic
highlight Comment gui=italic
let g:webdevicons_enable = 1
" netrw appearance
let g:netrw_liststyle = 0
let g:lightline = {
      \ 'colorscheme': 'palenight',
      \ }
" activate rainbow parenthesis
let g:rainbow_active = 1
" turn matching bracket into a bold white one
hi MatchParen guifg=yellow term=none cterm=none gui=italic gui=bold gui=underline
let g:semshi#error_sign = v:false
let g:semshi#mark_selected_nodes = 0
"}}}

"  +--------------------------------------------------+
"  |                   KEYBINDINGS                    |
"  +--------------------------------------------------+
"{{{ 
" <leader> is now ,
let mapleader = " "
let maplocalleader = " "

" exit terminal is now <esc>
tnoremap <Esc> <C-\><C-n><Esc>
" stay in visual mode while indenting
vnoremap < <gv
vnoremap > >gv

" make Y like C and D
nnoremap Y y$

" custom text object for inner line (no whitespace included)
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" custom text object for inner line (no whitespace included)
xnoremap <silent> ad :<c-u>normal! ggVG<cr>
onoremap <silent> ad :<c-u>normal! ggVG<cr>

" custom text object for inner bracket (synonym for i])
xnoremap <silent> is i]
onoremap <silent> is i]
xnoremap <silent> as a]
onoremap <silent> as a]



" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" navigate tabs easily
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" remap Q to repeat last macro 
nnoremap Q @@
" set U to be undo
nnoremap U <c-r>
nnoremap <c-r> :%s/\<<c-r><c-w>\>//g<left><left>
" use shift enter and enter to insert lines in normal mode
nnoremap <leader>o moo<Esc>`o
"change za to <leader>a
nnoremap <leader>a za

inoremap <nowait> jk <esc>
"}}}

"  +--------------------------------------------------+
"  |                       FZF                        |
"  +--------------------------------------------------+
" {{{
" set 'project root' to be git repository
function! s:find_git_root()
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
endfunction
nnoremap <leader>f <cmd>GFiles<cr>
nnoremap <leader>d <cmd>GFiles?<cr>
nnoremap <leader>b <cmd>Buffers<cr>
nnoremap <leader>g <cmd>Rg<cr>
" }}}

"  +--------------------------------------------------+
"  |                   COMMENT BOX                    |
"  +--------------------------------------------------+
"{{{
command! -nargs=1 Box call s:CommentBox(<f-args>)
function! s:CommentBox(comment)
  let curline = getline('.')
  let linelen = len(curline)
  let comlen = len(a:comment)
  let MAX_LEN = max([comlen+4, 50])
  let prefix = '|' . repeat(' ', (MAX_LEN - comlen) / 2)
  let suffix = repeat(' ', (MAX_LEN - comlen + 1) / 2) . '|'
  let bar =  '+' . repeat("-", MAX_LEN) . '+' 
  call append('.', [bar,  prefix . a:comment . suffix, bar])
  exec ":normal j3 cl"
  exec ":normal 0f+i  "
  exec ":normal j0f|i  "
  exec ":normal j0f+i  "
endfunction 
"}}}

"  +--------------------------------------------------+
"  |                 MULTIPLE CURSORS                 |
"  +--------------------------------------------------+
" {{{
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_word_key      = '<c-n>'
let g:multi_cursor_select_all_word_key = '<a-n>'
let g:multi_cursor_start_key           = 'g<c-n>'
let g:multi_cursor_select_all_key      = 'g<a-n>'
let g:multi_cursor_next_key            = '<c-n>'
let g:multi_cursor_prev_key            = '<c-p>'
let g:multi_cursor_skip_key            = '<c-x>'
let g:multi_cursor_quit_key            = '<esc>'
" }}}

"  +--------------------------------------------------+
"  |                 TURN THINGS OFF                  |
"  +--------------------------------------------------+
"  {{{
function! Hide()
  set noshowmode noruler laststatus=0 noshowcmd
endfunction
function! Show()
  set showmode ruler laststatus=2 showcmd
endfunction
" hide by default
call Hide()
command! Hide call Hide()
command! Show call Show()
"  }}}

"  +--------------------------------------------------+
"  |                      ASYNC                       |
"  +--------------------------------------------------+
"  {{{
command! -nargs=1 StartAsync
         \ call jobstart(<f-args>, {
         \    'on_exit': { j,d,e ->
         \       execute('echom "command finished with exit status '.d.'"', '')
         \    }
         \ })
"  }}}
