" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

syntax on

" general
set nocompatible
set hidden
set showmode
set encoding=utf-8
set fileencoding=utf-8
set noerrorbells
set visualbell
set ruler
set lazyredraw
set magic
set termguicolors
set splitbelow
set history=200
set number

" tabs/settings
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent

" vim-plug
call plug#begin()
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'fatih/vim-go'
  Plug 'brookhong/ag.vim'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'chriskempson/base16-vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'leafgarland/typescript-vim'
call plug#end()

colorscheme base16-material-darker

" key mappings
inoremap kj <esc>
inoremap <leader>w <esc>:write<cr>

" go mappings - to fix
"map <c-n> :cnext<cr>
"map <c-m> :cprevious<cr>
nnoremap <leader>a :cclose<cr>

"neovim terminal bindings
if has('nvim')
  tnoremap <esc> <c-\><c-n>
  tnoremap <m-[> <esc>
  tnoremap <c-v><esc> <esc>
  tnoremap <c-v>w <c-\><c-n><c-w>w
  :au BufEnter * if &buftype == 'terminal' | :startinsert | endif
endif

" vim-go bindings
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


" ctrlp detect project bases
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore', 'build.gradle', 'package.json', 'go.mod']
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|[\/](build|node_modules|out|.vscode)',
  \ 'file': '\v\.(exe|so|dll)$'
  \ }
let g:ctrlp_match_window = 'min:16,max:64'
