"== Pathogen =="

" To disable a plugin, add it's bundle name to the following list
" let g:pathogen_disabled = ['Valloric/YouCompleteMe.git']
" if !has('python3')
"    call add(g:pathogen_disabled, 'YouCompleteMe')
" endif

" I go with Pathogen for my plugin management. Unix Philosophy Right?
" I also will assume that all file locations relevent to dotfiles will
" be in the dotfiles dir in the user's homedir, Cause that's how I like
" it for now...
execute pathogen#infect('~/dotfiles/vim/bundle/{}', '~/dotfiles/vim/languages/{}', '~/dotfiles/vim/themes/{}')

" let mapleader="\<space>"                      " Get my Leader keys all situated. I'm a sucker for common comma
let localleader="\\"                          " and the backslash came from 'Learn VimScript the hard way'"
map <space> <leader>

" Get that Syntax Highlighting
" Arguably the developer's best friend
syntax on

" User indentation in plugins?
filetype plugin indent on

"== Settings =="
set nowrap                                    " Do not wrap lines
set number                                    " Get the line numbers going
set nospell                                   " Turn Spelling on
set showmatch                                 " Show matching parenthesis
syntax on                                     " Turn that syntax highlighting on
set autoindent                                " Automatically indent the lines to match the previous indent
"set smartindent                               " Automatically indent in the contents of functions
set shiftround                                " Use a multiple of shift width when indenting with '<' or '>
set copyindent                                " Copy the previous indentation
set tabstop=4                                 " Turn tabs into 4 spaces
set shiftwidth=4                              " Let each indent equal 4 spaces
set expandtab                                 " Use spaces instead of tabs
set smarttab                                  " Use shift width to set tabs instead of tabstop
set ignorecase                                " Ignore case when searching
set smartcase                                 " case insensitive if search term is all lowercased
set pastetoggle=<f12>                         " Set the past toggle to F-12 because pasting can be hard :P
set history=1000                              " Lets tore a bunch of old commands and things
set wildignore=*.swp,*.bak,*.pyc,*.class      " Ignore any of the files with the following extensions in tab completion
set title                                     " Let Vim set the window's title
set visualbell                                " Please no sounds, other then the patter of my fingers
set noerrorbells                              " Please no sounds, other then the patter of my fingers
set list                                      " Highlight whitespace
set listchars=tab:>.,trail:.,extends:#,nbsp:. " Set whitspace characters
set laststatus=2                              " Make sure that we use two lines for using status bars
set t_Co=256                                  " Make sure vim uses 256 color mode
set undolevels=1000                           " Store a ton of undo operations
set hidden
set backspace=2                               " Do the delete button thing
set conceallevel=2                            " Ensure that the cool conceling options are set
set colorcolumn=80                            " set an indicator for showing me where i can never be caugh outside
highlight colorcolumn ctermbg=cyan            " and make it cyan i guess

" set the colors
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Persistent file changing
set undodir=~/dotfiles/vim/undos/             " save these indos into a dile in .undos in the dotfiles dir
set undofile                                  " Save all undos into a file
" Ensure that the undo folder exists, and create it if it doesn't
if !isdirectory(&undodir)
    echom "Creating undo directory"
    call system('mkdir ' . &undodir)
endif


if v:version >= 704
   " echom "Woot vim > 7.04"
endif

"== Ctags =="

" C-] Follows a function to its definition
" C-T Pops back up the ctag stack
set tags+=./tags;/                            " Check the current directory, and then work up to the root, looking for tags
" Open up function definitions in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open up function definitions in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

" Auto Save/Reload VimViews
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"===== keystrokes ====="
"
" > Keystrokes define us, they grant us extra bonus perks that we can use
" > to slay our enemies.

" The Insertion operator
" | A binding made to take care of a very common keystroke in my life
nnoremap <cr> o<esc>
nnoremap <leader><cr> O<esc>

" The Maintainer
" | For the cautious and exact carpenter
nnoremap <leader>gg :Gstatus<cr> " I use g for efficiency, this is the most common case
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gv :Gvdiff<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gu :Gpull<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gf :Ggrep 
nnoremap <leader>gl :Git lolas<cr>

" The WebDev
" | That guy who has to sift through countless lines of JS
nnoremap <leader>jd :TernDoc<cr>
nnoremap <leader>jt :TernType<cr>
nnoremap <leader>jr :TernRefs<cr>


" The Alchemist
" | ev - Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 

" The Shape Shifter
" | sv - Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> 

" The Button Masher
" | Another escape sequence for the Insert Mode
inoremap kj <esc>
" | turn off the <esc> key for returning to normal mode from insert mode
inoremap <esc> <nop>

" The Quick Scoper
" | Cut out like 3 keystrokes from nearly every command
" | Beast Mode level command usage
noremap ; :
noremap : ;

" The Nwb Pwnr
" | I don't have a problem with this, But I put it here to make a point
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" The Digger
" | Dig down those function definitions
nnoremap <leader>tt <C-]>
nnoremap <leader>tu <C-t>

" The Quick Draw
" | Cut out the middle man. Quicker buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>

" The Bibliographer
" | Always check your sources
nnoremap <leader>h :help 


" The Stalker
" | Clear the search buffer
nmap <silent> ,/ :nohlsearch<CR>

" The Forgetful Oper
" | For the case where I forget to sudo before editing configuration files
cmap w!! w !sudo tee % >/dev/null

" The Smirk
" | replace all tabs in the current file with space characters
nnoremap <leader>nt :retab<cr>

" The Flip Flopper
" | Flop back and forth quicker from the beggining to the end of the line
nnoremap H ^
nnoremap L $

" The Klutz
" | No more will I accidently enter that damn Ex mode
nnoremap Q <nop>

" The Scrambler
" | Moving Lines Up and Down
nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==
inoremap <leader>J <Esc>:m .+1<CR>==gi
inoremap <leader>K <Esc>:m .-2<CR>==gi
vnoremap <leader>J :m '>+1<CR>gv=gv
vnoremap <leader>K :m '<-2<CR>gv=gv

" Two face
" | Switch between spec files and source in an angularjs project
nnoremap <leader>a :A<CR>

"==Plugins=="

" NERDTree
" | Toggle the NERDTree
noremap <f2> :NERDTreeToggle<cr>
" | NerdTree that is persistent acros open tabs
noremap <f3> <plug>NERDTreeTabsToggle<CR>

" TagBar
" | Toggle the tagbar
noremap <f4> :TagBarToggle<cr>

" UndoTree
" | Toggle the UndoTree window
noremap <f5> :UndotreeToggle<cr>

" GitGutter
" | Change the coloring in the GitGutter to ensure that is is actually visable
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" EasyMotion
" | Find stuff in the file with awesome ease
map  <leader>f <Plug>(easymotion-sn)
omap <leader>f <Plug>(easymotion-tn)

" VimJavascript
" | Some highlighting for javascript
let javascript_enable_domhtmlcss=1    " Enables HTML/CSS syntax highlighting in your JavaScript file.
let b:javascript_fold=1               " Enables JavaScript code folding.
let javascript_ignore_javaScriptdoc=0 " Disables JSDoc syntax highlighting
" Enable concealing characters to impress
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"


" UltiSnips and YouCompleteMe and SuperTab
" | better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger           = "<tab>"
let g:UltiSnipsJumpForwardTrigger      = "<tab>"
let g:UltiSnipsJumpBackwardTrigger     = "<s-tab>"
let g:UltiSnipsSnippetsDir             = ["~/dotFiles/vim/bundle/angular-vim-snippets/UltiSnips"]
" | make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion   = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
" | makes everything tab-completable!
let g:SuperTabDefaultCompletionType    = '<C-n>'

" Ctrlp
" | Fuzzy searching for project things
let g:ctrlp_extensions = ['tag']
nnoremap <leader>pp :CtrlPLastMode<cr> " Most common case
nnoremap <leader>pf :CtrlP<cr>        " Find a file
nnoremap <leader>pt :CtrlPTag<cr>     " Find tags in the project
nnoremap <leader>pb :CtrlPBuffer<cr>  " Find a term in the current buffer
nnoremap <leader>pr :CtrlPMRU<cr>     " Find a file in recent files

" VimAirline
" | I Love this thing...once you figure out the damn fonts
let g:airline#extensions#tabline#enabled = 1        " Enable the tab line when multiple files are opened
let g:airline#extensions#tabline#fnamemod = ':t'    " Only show the filename
let g:airline_powerline_fonts = 1                   " Yes, we have those damn fonts
let g:airline_theme = 'badwolf'

" CoVim
" | (Plugin is a bust. Made in a senior capstone)
" | Awesome Idea though...
let CoVim_default_name = "MrRacoon"
let CoVim_default_port = "13337"

" TagBar
" | Tell it how to javascript
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
    \ }

"===SCRATCH SPACE==="
" Anything below here is considered temporary, and may be removed whenever
