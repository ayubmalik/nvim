" syntax highlighting
syntax on

" filetype flags
filetype indent plugin on

" general
set autoread
set cursorline
set encoding=utf-8
set fileencoding=utf-8
set hidden
set history=100
set lazyredraw
set magic
set noerrorbells
set nofoldenable
set number
set ruler
set splitbelow
set splitright
set termguicolors
set visualbell
set wildmenu

" tabs/settings
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=4
set tabstop=4

" key mappings
inoremap kj <esc>
inoremap <leader>w <esc>:write<cr>
inoremap <c-s> <esc>:update<cr>
nnoremap <f2> :set relativenumber!<cr>
nnoremap <f3> :set hlsearch!<cr>
nnoremap <c-s> :update<cr>

"neovim terminal bindings
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <m-[> <esc>
  tnoremap <c-v><esc> <esc>
  tnoremap <c-v>w <c-\><c-n><c-w>w
  :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
endif

" netrw
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_hide = 1
let g:netrw_liststyle = 0
let g:netrw_list_hide = '^\..*,.*\.lock$,tags'
let g:netrw_winsize = 20

" vim-plug
call plug#begin()
  Plug 'chriskempson/base16-vim'
  Plug 'fatih/vim-go'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'leafgarland/typescript-vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme base16-material-darker

" vim-go bindings
nnoremap <leader>a :cclose<cr>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0
"map <c-n> :cnext<cr>
"map <c-m> :cprevious<cr>

" FZF mappings
let $FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.vscode/*,.idea/*}"'
nnoremap <c-p> :Files<cr>
