syntax on

set noerrorbells
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set nu
set relativenumber
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir/
set undofile
set incsearch
set encoding=utf-8
set splitbelow
set fillchars=stl:^,stlnc:=,vert:\ ,fold:-,diff:-
 
set colorcolumn=80
highligh ColorColumn ctermbg=0 

"PLUGINS
call plug#begin('~/.config/nvim/autoload')
Plug 'liuchengxu/vim-which-key'

Plug 'morhetz/gruvbox'                                  " Themes
Plug 'jacoborus/tender'
Plug 'mhinz/vim-startify'                               " Startscreen
Plug 'sheerun/vim-polyglot'                             " Better language syntax support
Plug 'christoomey/vim-tmux-navigator'

Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'                       " Default snippets for many languages

"Plug 'neoclide/coc.nvim', {'branch': 'release'}        " Intellisense
Plug 'davidhalter/jedi-vim'
"Plug 'nvim-treesitter/nvim-treesitter'
Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'                       " Typescript support
Plug 'vim-utils/vim-man'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'fatih/vim-go'                                     " Go support
Plug 'majutsushi/tagbar'
Plug 'stamblerre/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

Plug 'jiangmiao/auto-pairs'                             " Auto pairs for '(' '[' '{'
Plug 'alvan/vim-closetag'                               " Closetags
Plug 'honza/vim-snippets'                               " Snippets
Plug 'mattn/emmet-vim'
Plug 'norcalli/nvim-colorizer.lua'                      " Colors
Plug 'machakann/vim-highlightedyank'

Plug 'junegunn/fzf', { 'do' : { -> fzf#install()}}      " FZF 
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'ctrlpvim/ctrlp.vim'                               " Ctrl+p
Plug 'preservim/nerdtree'                               " File Navigation
Plug 'justinmk/vim-sneak'                               " Sneak - in file navigation
Plug 'mbbill/undotree'                                  " Undotree
Plug 'tpope/vim-fugitive'                               " Git
Plug 'vim-airline/vim-airline'                          " Git status bar and theme
Plug 'vim-airline/vim-airline-themes'

Plug 'puremourning/vimspector'                          " Debugger
Plug 'szw/vim-maximizer'

call plug#end()

colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
set background=dark
hi HighlightedyankRegion term=bold ctermbg=0 guibg=#458588
let g:airline_theme='base16'

"Reload vim on startup
autocmd VimEnter * source $MYVIMRC

"Install missing plugins on startup
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

"Add treesitter package on load : TODO test if still required
"autocmd VimEnter * packadd nvim-treesitter

if executable('rg') 
    let g:rg_derive_root='true'
endif

let mapleader = " "

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

"Keys mapped to Ctrl
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-t> <C-w><C-t>
nnoremap <C-b> <C-w><C-b>
nnoremap <C-n> :NERDTreeToggle <bar> :vertical resize 35<CR>

"Move v code blocks
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

source $HOME/.config/nvim/keys/which-key.vim
source $HOME/.config/nvim/sources/go.vim
source $HOME/.config/nvim/sources/neomake.vim
source $HOME/.config/nvim/sources/nerdtree.vim
source $HOME/.config/nvim/sources/tmux.vim

"Autocomplete Candidates
"source $HOME/.config/nvim/sources/gocode.vim
"source $HOME/.config/nvim/plug-config/coc/coc.vim
"source $HOME/.config/nvim/sources/coc.vim

