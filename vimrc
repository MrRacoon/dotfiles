" I map leader to the space bar. Because it simply rocks. I use map here
" because it seems to work better in insert mode.
map <space> <leader>

" Get that Syntax Highlighting
" Arguably the developer's best friend
syntax on

" Ensure filetype specific plugins
filetype plugin indent on

" =============================================================================
" Settings

" Gui
set nowrap                                    " no line wrapping
set number                                    " show line numbers
set nospell                                   " spelling off by default
set showmatch                                 " show matching parenthesis

" Highlighting
syntax on                                     " use syntax highlighting

" Indents
set autoindent                                " automatically indent lines
set smartindent                               " automatically indent for context
set copyindent                                " copy the previous indentation

" Tabbing
set shiftround                                " use a multiple of shiftWidth when indenting with '<' or '>
set tabstop=2                                 " turn tabs into 2 spaces
set shiftwidth=2                              " let each indent equal 2 spaces
set expandtab                                 " use spaces instead of tabs
set smarttab                                  " use shift width to set tabs instead of tabstop

" Searching
set ignorecase                                " ignore case when searching
set smartcase                                 " case insensitive if search term is all lowercased

" Process
set pastetoggle=<f12>                         " set the past toggle to F-12 because pasting can be hard :P
set history=1000                              " lets tore a bunch of old commands and things
set title                                     " let vim set the window's title
set visualbell                                " disable sounds
set noerrorbells                              " disable sounds
set laststatus=2                              " make sure that we use two lines for using status bars
set t_Co=256                                  " make sure vim uses 256 color mode
set backspace=2                               " sane delete button
set mouse=r                                   " enable mouse usage
set hidden                                    " hiding buffers
set colorcolumn=80                            " set the maximum line width
highlight colorcolumn ctermbg=black           " and make it cyan i guess

" Whitespace
set list                                      " highlight whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:. " set whitespace characters

" Concealment
set conceallevel=2                            " add concealment

" Undos
set undofile                                  " save all undos into a file
set undolevels=1000                           " store a ton of undo operations
set undodir=~/dotfiles/vim/undos/             " save undos into dotfile dir
if !isdirectory(&undodir)
  echom "Creating undo directory"
  call system('mkdir ' . &undodir)
endif

" =============================================================================
" Vim keystrokes

" personal <esc> key sequences
inoremap kj <esc>

" swap the commmand key with ';'
noremap ; :
noremap : ;

" Ctrl-p searching
nnoremap <leader>pf :CtrlP<cr>
nnoremap <leader>pp :CtrlP<cr>

" vimrc sourcing/editing
nnoremap <leader>ve :vsplit $MYVIMRC<cr> 
nnoremap <leader>vr :source $MYVIMRC<cr> 

" remove the arrow key functionality
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" remove the 'Q' functionality
nnoremap Q <nop>

" split switching
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" force escalated privilege saves
cmap w!! w !sudo tee % >/dev/null

" remove tabs
nnoremap <leader>nt :retab<cr>

" full line width movement
nnoremap H ^
nnoremap L $

" =============================================================================
" Plugins

call plug#begin('~/dotfiles/vim/plugged')

" sensible defaults
" Plug 'tpope/vim-sensible'

" Git integrations
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Javascript integrations
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'isruslan/vim-es6'

" Syntactic checking
Plug 'scrooloose/syntastic'

" Fuzzy file finding
Plug 'kien/ctrlp.vim'

" Solarized
Plug 'altercation/vim-colors-solarized'

" Airline statusbar
Plug 'bling/vim-airline'

" Sidebar and commenting plugins
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'

" Movement Booster
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

" Completion
Plug 'Shougo/neocomplete'
Plug 'godlygeek/tabular'
Plug 'raimondi/delimitmate'
Plug 'ervandew/supertab'

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Boost the power of the '.' command
Plug 'tpope/vim-repeat'

" Html completion
Plug 'mattn/emmet-vim'

" Indent guides
Plug 'nathanaelkane/vim-indent-guides'

" Preserve folding and position
Plug 'vim-scripts/restore_view.vim'

" alignment
Plug 'junegunn/tabularize'

" testing
Plug 'janko-m/vim-test'

Plug 'elmcast/elm-vim'

call plug#end()

" =============================================================================
" Plugin settings

" enable flowtypes
let g:javascript_plugin_flow = 1
" enable jsx highlighting in .js files
let g:jsx_ext_required = 0

" =============================================================================
" Plugin keystrokes

" VimFugitive git integrations
nnoremap <leader>gib :Gblame<cr>
nnoremap <leader>gic :Gcommit<cr>
nnoremap <leader>gid :Gdiff<cr>
nnoremap <leader>gif :Ggrep 
nnoremap <leader>gig :Gstatus<cr>
nnoremap <leader>gih :help fugitive<cr>
nnoremap <leader>gil :Git hist<cr>
nnoremap <leader>gip :Gpush<cr>
nnoremap <leader>gis :Gstatus<cr>
nnoremap <leader>giu :Gpull<cr>
nnoremap <leader>giv :Gvdiff<cr>

" Vim-Plug commands
nnoremap <leader>pc :PlugClean<cr>
nnoremap <leader>pi :PlugInstall<cr>
nnoremap <leader>pu :PlugUpdate<cr>

" Nerd tree
nnoremap <leader>tr :NERDTreeToggle<cr>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Solarized
" colorscheme solarized

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-n>"

" Tabularize
vnoremap <leader>tb :Tabularize/
vnoremap <leader>tb= :Tabularize/=<cr>
vnoremap <leader>tb" :Tabularize/"<cr>
vnoremap <leader>tb, :Tabularize/,<cr>

" vim test
nnoremap <silent> <leader>vtt :TestNearest<CR>
nnoremap <silent> <leader>vtf :TestFile<CR>
nnoremap <silent> <leader>vta :TestSuite<CR>
nnoremap <silent> <leader>vtl :TestLast<CR>
nnoremap <silent> <leader>vtg :TestVisit<CR>

" neo
let g:neocomplete#enable_at_startup = 1
let g:neosnippet#snippets_directory='~/.vim/snippets'

" elm
let g:elm_make_show_warnings = 1

