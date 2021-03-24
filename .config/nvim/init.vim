"  +--------------------------------------------------+
"  |                     PLUGINS                      |
"  +--------------------------------------------------+
" {{{
filetype off 
let nvim_path = '~/.config/nvim/'
call plug#begin(nvim_path . 'bundle')
" Connecting with external software
Plug 'neovim/nvim-lsp'                                                  " intellisense and autocompletion
Plug 'RishabhRD/popfix'                                                 " nvim lsp stuff
Plug 'RishabhRD/nvim-lsputils'                                          " nvim lsp stuff
Plug 'haorenW1025/completion-nvim'                                      " auto-completion for nvim-lsp
Plug 'tpope/vim-fugitive'                                               " git integration
Plug 'voldikss/vim-floaterm'                                            " floating terminal
Plug 'junegunn/fzf.vim'                                                 " fzf 
Plug 'junegunn/fzf'                                                     " fzf 
" Vim nicities & features
Plug 'tpope/vim-repeat'                                                 " repeat things with . operator
Plug 'michaeljsmith/vim-indent-object', {'for': 'python'}               " indent object, mainly for python
Plug 'tpope/vim-surround'                                               " surround text
Plug 'terryma/vim-multiple-cursors'                                     " multi-cursor
Plug 'scrooloose/nerdcommenter'                                         " easy text commenting
Plug 'godlygeek/tabular'                                                " tabular: align on character
Plug 'SirVer/ultisnips'                                                 " snippets engine
Plug 'rstacruz/vim-closer'                                              " auto pairs
" Pretty things
Plug 'luochen1990/rainbow'                                              " rainbow parentheses
Plug 'drewtempelmeyer/palenight.vim'                                    " themes and airline
Plug 'itchyny/lightline.vim'                                            " status line
Plug 'ryanoasis/vim-devicons'                                           " dev icons
Plug 'norcalli/nvim-colorizer.lua'                                      " colorizer for hex codes
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
colorscheme palenight
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
" vimspector
let g:vimspector_enable_mappings = 'HUMAN'

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
"  |                    ULTISNIPS                     |
"  +--------------------------------------------------+
" {{{
let g:UltiSnipsExpandTrigger =  '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<c-l>'
let g:UltiSnipsJumpBackwardTrigger = '<c-h>'
let g:UltiSnipsSnippetDirectories = ["/home/offendo/.config/nvim/UltiSnips/"]
"}}}

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
"  |                     NVIM-LSP                     |
"  +--------------------------------------------------+
" {{{
" Set diagnostic colors
hi! LspDiagnosticsError guifg=LightRed
hi! LspDiagnosticsWarning guifg=Orange
hi! LspDiagnosticsHint guifg=LightBlue
:lua << EOF
local nvim_lsp = require('nvim_lsp')
nvim_lsp.pyls.setup{on_attach=require'completion'.on_attach,
  init_options = {
    interpreter = {
      properties =
      {
        InterpreterPath = vim.fn.exepath("python3.9");
        Version = "3.9";
      };
    };
    displayOptions = {};
    analysisUpdates = true;
    asyncStartup = true;
  };
}
nvim_lsp.clangd.setup{on_attach=require'completion'.on_attach}
nvim_lsp.hls.setup{on_attach=require'completion'.on_attach}
nvim_lsp.elmls.setup{on_attach=require'completion'.on_attach}
nvim_lsp.texlab.setup{
  settings = {
    bibtex = {
      formatting = {
        lineLength = 120
      }
    },
    latex = {
      build = {
        args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "-output-directory=build", "-shell-escape"},
        executable = "latexmk",
        onSave = true
      },
      lint = {
        onChange =  true,
      }
    }
  }
}
-- remove the floating text
do
    local method = 'textDocument/publishDiagnostics'
    local default_callback = vim.lsp.callbacks[method]
    vim.lsp.callbacks[method] = function(err, method, result, client_id)
        if not result then return end
        local uri = result.uri
        local bufnr = vim.uri_to_bufnr(uri)
        if not bufnr then
            err_message("LSP.publishDiagnostics: Couldn't find buffer for ", uri)
            return
        end
        vim.lsp.util.buf_clear_diagnostics(bufnr)
        vim.lsp.util.buf_diagnostics_save_positions(bufnr, result.diagnostics)
        vim.lsp.util.buf_diagnostics_underline(bufnr, result.diagnostics)
        -- vim.lsp.util.buf_diagnostics_virtual_text(bufnr, result.diagnostics)
        vim.lsp.util.buf_diagnostics_signs(bufnr, result.diagnostics)
        vim.api.nvim_command("doautocmd User LspDiagnosticsChanged")
    end
end
vim.lsp.callbacks['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
vim.lsp.callbacks['textDocument/references'] = require'lsputil.locations'.references_handler
vim.lsp.callbacks['textDocument/definition'] = require'lsputil.locations'.definition_handler
vim.lsp.callbacks['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
vim.lsp.callbacks['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
vim.lsp.callbacks['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
vim.lsp.callbacks['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
vim.lsp.callbacks['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
EOF

nnoremap <silent>gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent>gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gy    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn    <cmd>lua vim.lsp.buf.rename()<cr>
nnoremap <silent>K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap L             <cmd>lua vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>p     <cmd>lua vim.lsp.buf.formatting()<cr>

let g:completion_enable_auto_signature = 1
let g:completion_confirm_key="\<C-y>"

" Auto close popup menu when finish completion
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" }}}

"  +--------------------------------------------------+
"  |                    FLOATTERM                     |
"  +--------------------------------------------------+
"  {{{
let g:floaterm_winblend=0
hi FloatermNF guibg=default
hi FloatermBorderNF guibg=ignore guifg=ignore
let g:floaterm_position='center'
nnoremap - <cmd>FloatermNew fff<cr>
nnoremap <c-c> :FloatermKill<cr>
nnoremap <c-c> :FloatermKill<cr>
" ,. is now open terminal
nnoremap <silent><leader>. <cmd>FloatermToggle<cr>
nnoremap <silent><leader>t <cmd>split<cr><cmd>term<cr>
"  }}}

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

"  +--------------------------------------------------+
"  |                  REPLACE NETRW                   |
"  +--------------------------------------------------+
"  {{{
augroup ReplaceNetrwByFFF
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | call floaterm#run('new', !0, 'fff') | endif
augroup END
"  }}}
