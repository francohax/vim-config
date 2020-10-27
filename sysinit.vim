syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set nu
set relativenumber
set smartcase
set noswapfile
set nobackup
set undodir=~\vimfiles\undodir
set undofile
set incsearch
set encoding=utf-8
set splitbelow
set fillchars=stl:^,stlnc:=,vert:\ ,fold:-,diff:-

set colorcolumn=80
highligh ColorColumn ctermbg=0 

call plug#begin('~/vimfiles/plugged')

"Better language syntax support
Plug 'sheerun/vim-polyglot'

"Themes
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'

"Git
Plug 'tpope/vim-fugitive'
"Git status bar and theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Typescript support
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'

"Sneak - in file navigation
Plug 'justinmk/vim-sneak'

"FZF File Navigation
Plug 'junegunn/fzf', { 'do' : { -> fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'

"File Navigation
Plug 'preservim/nerdtree'

"Undotree
Plug 'mbbill/undotree'

"Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ycm-core/YouCompleteMe'
"Auto pairs for '(' '[' '{'
Plug 'jiangmiao/auto-pairs'
" Closetags
Plug 'alvan/vim-closetag'

" Start Screen
Plug 'mhinz/vim-startify'

" Snippets
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'

" Colorizer
Plug 'norcalli/nvim-colorizer.lua'

call plug#end()

colorscheme gruvbox
set background=dark

" Automatically install missing plugins on startup
autocmd VimEnter *
\  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
\|   PlugInstall --sync | q
\| endif

if executable('rg') 
    let g:rg_derive_root='true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "

let g:ctrlp_use_caching = 0

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:airline_theme='base16'

"Explorer Mappings
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow <bar> :vertical resize 50<CR>

"NERDTree mappings
nnoremap <C-n> :NERDTreeToggle <bar> :vertical resize 35<CR>
nnoremap <leader>n :NERDTreeToggle <bar> :vertical resize 35<CR> 
autocmd StdinReadPre * let s:std_in=1

"FZF Mappings
nnoremap <silent> <C-f> :Files<CR>

"YMC mappings
nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gr :YcmCompleter FixIt<CR>

"Fugitive mappings
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gf :diffget //2<CR>
nnoremap <leader>gs :G<CR>

"Split mappings
nmap <C-k> :split<CR>
nmap <C-l> :vsp<CR>

"Control Code Completion
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Delegates which autocompleter to use
autocmd FileType ts,typescript,java,go :call GoYCM()
autocmd FileType js,html,css,sccs,cpp,h :call GoCoc()

"Use YCM for code completion
fun! GoYCM()
    nnoremap <buffer> <silent> <leader>gd :YcmCompleter GoTo<CR>
    nnoremap <buffer> <silent> <leader>gr :YcmCompleter GoToReferences<CR>
    nnoremap <buffer> <silent> <leader>rr :YcmCompleter RefactorRename<CR>
endfun

"Coc Standard config
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

"Use Coc for code completion
fun! GoCoc()
    inoremap <buffer> <silent><expr> <TAB>
                \ pumvisible() ? "\C-n>" :
                \ <SID>check_back_space() ? "\<TAB>" :
                \ coc#refresh()

    inoremap <buffer> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
    inoremap <buffer> <expr><C-space>

    " GoTo code navigation
    nmap <buffer> <leader>gd <Plug>(coc-definition)
    nmap <buffer> <leader>gy <Plug>(coc-type-definition)
    nmap <buffer> <leader>gi <Plug>(coc-implementation)
    nmap <buffer> <leader>gr <Plug>(coc-references)
    nnoremap <buffer> <leader> cr :CocRestart
endfun

