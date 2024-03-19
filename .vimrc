" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Python autocompletion, go to definition.
Plug 'davidhalter/jedi-vim'

" Better file browser
Plug 'scrooloose/nerdtree'

" Code commenter
Plug 'scrooloose/nerdcommenter'

" Python and other languages code checker
Plug 'scrooloose/syntastic'

" Shows modified lines for git
Plug 'airblade/vim-gitgutter'

" for changes surroudings
Plug 'tpope/vim-surround'

" solarized theme
Plug 'lifepillar/vim-solarized8'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()


" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" Airline theme
let g:airline_theme = 'bubblegum'
let g:airline_solarized_bg='dark'

" --------------------------- NERDComment default ----------------------------
"Required for NERDCommented
filetype plugin on


" --------------------------- NERDTree default ----------------------------
" Automatically Opens NERDTree
"autocmd vimenter * NERDTree
"close nerdtree when it's only last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"keymapping for NERDTree
map <C-n> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" recomanded setting for syntastic
" --------------------------- syntastic default ----------------------------
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" passive mode
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>


" --------------------------- gitgutter default ----------------------------
let g:gitgutter_highlight_lines = 1

" --------------------------- solarized  default ----------------------------
set background=dark
colorscheme solarized8


set number relativenumber
set nu
colorscheme desert
syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
"when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" for copy paste idented code
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
