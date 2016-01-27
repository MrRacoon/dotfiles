source /home/erik/dotfiles/vim/autoload/pathogen.vim

" I go with Pathogen for my plugin management. Unix Philosophy Right?
execute pathogen#infect('~/dotfiles/vim/bundle/{}', '~/dotfiles/vim/languages/{}', '~/dotfiles/vim/themes/{}')

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
set mouse=r
set hidden
set conceallevel=2                            " Ensure that the cool conceling options are set
set colorcolumn=80                            " set an indicator for showing me where i can never be caugh outside
set undodir=~/dotfiles/vim/undos/             " save these indos into a dile in .undos in the dotfiles dir
set undofile                                  " Save all undos into a file
set tags+=./tags;/                            " Check the current directory, and then work up to the root, looking for tags
highlight colorcolumn ctermbg=cyan            " and make it cyan i guess

if !isdirectory(&undodir)
    echom "Creating undo directory"
    call system('mkdir ' . &undodir)
endif

" Auto Save/Reload VimViews
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

"== keystrokes =="

" better <esc> key sequences
inoremap kj <esc>

" Swap the commmand key and that.. other.. thing...
noremap ; :
noremap : ;

" Git commands
nnoremap <leader>gig :Gstatus<cr>
nnoremap <leader>gis :Gstatus<cr>
nnoremap <leader>gic :Gcommit<cr>
nnoremap <leader>gid :Gdiff<cr>
nnoremap <leader>giv :Gvdiff<cr>
nnoremap <leader>gif :Ggrep 
nnoremap <leader>giu :Gpull<cr>
nnoremap <leader>gip :Gpush<cr>
nnoremap <leader>gib :Gblame<cr>
nnoremap <leader>gil :Git hist<cr>
nnoremap <leader>gih :help fugitive<cr>

" Edit vim key bindings
nnoremap <leader>ve :vsplit $MYVIMRC<cr> 
nnoremap <leader>vs :source $MYVIMRC<cr> 

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <silent> ,/ :nohlsearch<CR>

cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>nt :retab<cr>

nnoremap H ^
nnoremap L $

nnoremap Q <nop>

nnoremap <leader>J :m .+1<CR>==
nnoremap <leader>K :m .-2<CR>==
inoremap <leader>J <Esc>:m .+1<CR>==gi
inoremap <leader>K <Esc>:m .-2<CR>==gi
vnoremap <leader>J :m '>+1<CR>gv=gv
vnoremap <leader>K :m '<-2<CR>gv=gv

nnoremap <CR> o<ESC>
nnoremap <leader><CR> O<ESC>

"===== Plugins ====="

noremap <f2> :NERDTreeToggle<cr>
map <f3> <plug>NERDTreeTabsToggle<CR>

noremap <f4> :TagBarToggle<cr>

noremap <f5> :UndotreeToggle<cr>

" GitGutter
" Change the coloring in the GitGutter to ensure that is is actually visable
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Open up function definitions in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open up function definitions in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

" VimJavascript
" Enables HTML/CSS syntax highlighting in your JavaScript file.
let javascript_enable_domhtmlcss=1
" Enables JavaScript code folding.
let b:javascript_fold=1
" Disables JSDoc syntax highlighting
let javascript_ignore_javaScriptdoc=0
" Enable concealing characters to impress
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"

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
