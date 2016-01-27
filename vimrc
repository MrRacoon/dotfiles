"== Pathogen =="

source /home/erik/dotfiles/vim/autoload/pathogen.vim

" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = ['Valloric/YouCompleteMe.git']
if !has('python3')
   call add(g:pathogen_disabled, 'YouCompleteMe')
endif

" I go with Pathogen for my plugin management. Unix Philosophy Right?
execute pathogen#infect('~/dotfiles/vim/bundle/{}', '~/dotfiles/vim/languages/{}', '~/dotfiles/vim/themes/{}')
", '~/.vim/bundle/{}')

" I always figure that the leader information should always be located at the
" top of this file for anyone who might want to try, and need a quick way to
" find out.
" I map leader to the space bar. Because it simply rocks. I use map here
" because it seems to work better in insery mode.
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
set backspace=2                               " Do the delete button thing
set hidden

if v:version >= 704

   "== Persistent file changing =="
   set undodir=~/dotfiles/vim/undos/             " save these indos into a dile in .undos in the dotfiles dir
   set undofile                                  " Save all undos into a file
   if !isdirectory(&undodir)
      echom "Creating undo directory"
      call system('mkdir ' . &undodir)
   endif
   set colorcolumn=80                            " set an indicator for showing me where i can never be caugh outside
   highlight colorcolumn ctermbg=cyan            " and make it cyan i guess

   " Enable concealing characters to impress
   set conceallevel=2                            " Ensure that the cool conceling options are set
   let g:javascript_conceal_function   = "ƒ"
   let g:javascript_conceal_null       = "ø"
   let g:javascript_conceal_this       = "@"
   let g:javascript_conceal_return     = "⇚"
   let g:javascript_conceal_undefined  = "¿"
   let g:javascript_conceal_NaN        = "ℕ"
   let g:javascript_conceal_prototype  = "¶"

   " EasyMotion
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

" Auto Save/Reload VimViews
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

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


" The maintainer
" | An assortmant of git commands
nnoremap <leader>gg :Gstatus<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gv :Gvdiff<cr>
nnoremap <leader>gf :Ggrep 
nnoremap <leader>gu :Gpull<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gl :Git hist<cr>
nnoremap <leader>gh :help fugitive<cr>


" The Nwb Pwnr
" | I don't have a problem with this, But I put it here to make a point
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
" | Clear the search buffer
nmap <silent> ,/ :nohlsearch<CR>

" The Forgetful Oper
" | For the case where I forget to sudo before editing configuration files
cmap w!! w !sudo tee % >/dev/null

" The Smirk
" | Replace all tabs in the current file with space characters
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

" The OCDork
" | I use this map because the action has become so common in my world
nnoremap <CR> o<ESC>
nnoremap <leader><CR> O<ESC>

"===== Plugins ====="

" NERDTree
" f2 -> Toggle NerdTree
noremap <f2> :NERDTreeToggle<cr>
" NerdTree that is persistent acros open tabs
" f3 -> Toggle NerdTreeTabs
map <f3> <plug>NERDTreeTabsToggle<CR>

" TagBar
" f4 -> Toggle the tagbar
noremap <f4> :TagBarToggle<cr>

" UndoTree
" f5 -> Toggle the UndoTree window
" Toggle the undo tree
" Awesome Plugins
noremap <f5> :UndotreeToggle<cr>

" GitGutter
" Change the coloring in the GitGutter to ensure that is is actually visable
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" EasyMotion
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
noremap  n <Plug>(easymotion-next)
noremap  N <Plug>(easymotion-prev)

" VimJavascript
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let javascript_enable_domhtmlcss=1
" Enables JavaScript code folding.
let b:javascript_fold=1
" Disables JSDoc syntax highlighting
let javascript_ignore_javaScriptdoc=0

" UltiSnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsSnippetsDir ="~/dotfiles/vim/snippets"
", ~/dotfiles/vim/bundle/snippets/angular-vim-snippets/UltiSnips"
" TODO: Fix this mess
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-d>"
let g:UltiSnipsJumpBackwardTrigger="<c-u>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" VimAirline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" YouCompleteMe
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]

" CoVim
" (Plugin is a bust. Made in a senior capstone)
" Awesome Idea though...
let CoVim_default_name = "MrRacoon"
let CoVim_default_port = "13337"

" TagBar
" Tell it how to javascript
let g:tagbar_type_javascript = {
    \ 'ctagstype' : 'JavaScript',
    \ 'kinds'     : [
        \ 'o:objects',
        \ 'f:functions',
        \ 'a:arrays',
        \ 's:strings'
    \ ]
    \ }

" ===== SCRATCH SPACE ===== "
" Anything below here is considered temporary, and may be removed whenever

" Reload
map <silent> tu :call GHC_BrowseAll()<CR>
" Type Lookup
map <silent> tw :call GHC_ShowType(1)<CR>

" Add RiotJs Syntaxing
au BufNewFile,BufRead *.tag setlocal ft=html

let g:jsx_ext_required = 0
