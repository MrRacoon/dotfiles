"== Pathogen =="

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['Valloric/YouCompleteMe.git']
if !has('python3')
   call add(g:pathogen_disabled, 'YouCompleteMe')
endif




" I go with Pathogen for my plugin management. Unix Philosophy Right?
execute pathogen#infect('~/dotfiles/vim/bundle/{}', '~/dotfiles/vim/languages/{}', '~/dotfiles/vim/themes/{}', '~/dotfiles/vim/snippets/{}')
", '~/.vim/bundle/{}')

" I always figure that the leader information should always be located at the
" top of this file for anyone who might want to try, and need a quick way to
" find out.
let mapleader=","                             " Get my Leader keys all situated. I'm a sucker for common comma
let localleader="\\"                          " and the backslash came from 'Learn VimScript the hard way'"
set backspace=2                               " Do the delete button thing

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
set shiftwidth=3                              " Let each indent equal 4 spaces
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

if v:version >= 704
   "== Persistent file changing =="
   set undodir=~/dotfiles/vim/undos/             " save these indos into a dile in .undos in the dotfiles dir
   set undofile                                  " Save all undos into a file
   if !isdirectory(&undodir)
      echom "Creating undo directory"
      call system('mkdir ' . &undodir)
   endif
   set conceallevel=2                            " Ensure that the cool conceling options are set
   set colorcolumn=80                            " set an indicator for showing me where i can never be caugh outside
   highlight colorcolumn ctermbg=cyan            " and make it cyan i guess
   " Enable concealing characters to impress
   let g:javascript_conceal_function   = "ƒ"
   let g:javascript_conceal_null       = "ø"
   let g:javascript_conceal_this       = "@"
   let g:javascript_conceal_return     = "⇚"
   let g:javascript_conceal_undefined  = "¿"
   let g:javascript_conceal_NaN        = "ℕ"
   let g:javascript_conceal_prototype  = "¶"
   " EasyMotion
   " Gif config
   map  / <Plug>(easymotion-sn)
   omap / <Plug>(easymotion-tn)
endif
" Ensure that the undo folder exists, and create it if it doesn't

"== Ctags =="

" C-] Follows a function to its definition
" C-T Pops back up the ctag stack
set tags+=./tags;/                            " Check the current directory, and then work up to the root, looking for tags
" Open up function definitions in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open up function definitions in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

"== keystrokes =="
" Keystrokes define us, they grant us extra bonus perks that we can use
" to slay our enemies.

" The Alchemist
" ev - Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr> 

" The Shape Shifter
" sv - Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<cr> 

" The Button Masher
" Another escape sequence for the Insert Mode
inoremap kj <esc>
" The Button Masher (Upgrade)
" turn off the <esc> key for returning to normal mode from insert mode
inoremap <esc> <nop>

" The Quick Scoper
" Cut out like 3 keystrokes from nearly every command
noremap ; :
" The NoScoper
" Beast Mode level command usage
" 'damn this is hard to relearn' - me
noremap : ;

" The Nwb Pwnr
" I don't have a problem with this, But I put it here to make a point
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" The Quick Draw
" | Cut out the middle man. Quicker buffer navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
"map <C-k> <C-w>k
map <C-l> <C-w>l



" The Stalker
" Clear the search buffer
nmap <silent> ,/ :nohlsearch<CR>

" The Forgetful Oper
" For the case where I forget to sudo before editing configuration files
cmap w!! w !sudo tee % >/dev/null

" The Smirk
" replace all tabs in the current file with space characters
nnoremap <leader>nt :retab<cr>

" The Flip Flopper
" Flop back and forth quicker from the beggining to the end of the line
nnoremap H ^
nnoremap L $

" The Klutz
" No more will I accidently enter that damn Ex mode
nnoremap Q <nop>

"==Plugins=="

" NERDTree
" Map f2 to toggle the NERDTree
noremap <f2> :NERDTreeToggle<cr>

" GitGutter
" Change the coloring in the GitGutter to ensure that is is actually visable
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" UndoTree
" toggle the undo tree
noremap <f5> :UndotreeToggle<cr>

"
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Vim-Javascript
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let javascript_enable_domhtmlcss=1
" Enables JavaScript code folding.
let b:javascript_fold=1
" Disables JSDoc syntax highlighting
let javascript_ignore_javaScriptdoc=0
" Toggle Nerd Tree Tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir ="~/dotfiles/vim/bundle/vim-snippets/snippets"
", ~/dotfiles/vim/bundle/snippets/angular-vim-snippets/UltiSnips"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" You Complete Me
"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

"== SCRATCH SPACE =="
" Anything below here is considered temporary, and may be removed whenever
