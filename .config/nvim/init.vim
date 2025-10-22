" Specify Vim-Plug installation folder 
"call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" Install the Nightfly color scheme plugin
Plug 'bluz71/vim-nightfly-guicolors'

" Enable 24-bit true color support
set termguicolors

Plug 'preservim/nerdtree'         " File explorer
Plug 'junegunn/fzf.vim'           " Fuzzy finder
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Intellisense via LSP
Plug 'vim-airline/vim-airline'    " Status bar
Plug 'tpope/vim-commentary'       " Easy commenting
Plug 'tpope/vim-surround'         " Bracket/quote manipulation

" Complete Vim-Plug configuration
call plug#end() 

" Activate the Nightfly theme
colorscheme nightfly


syntax on
set number
set relativenumber
set tabstop=4 shiftwidth=4 expandtab
set clipboard=unnamedplus
set mouse=a

nnoremap <C-n> :NERDTreeToggle<CR>
