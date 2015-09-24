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

" I always figure that the leader information should always be located at the
" top of this file for anyone who might want to try, and need a quick way to
" find out.
map <SPACE> <leader>

" Get that Syntax Highlighting
" Arguably the developer's best friend
set regexpengine=1
syntax on

" User indentation in plugins?
filetype plugin indent on

"== Settings =="
set shortmess+=I                              " Disable the intro text in vim
set nowrap                                    " Do not wrap lines
set number                                    " Get the line numbers going
set spell                                     " Turn Spelling on
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
set colorcolumn=80,120                            " set an indicator for showing me where i can never be caugh outside
"set foldmethod=syntax
"set foldlevelstart=0
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


" Ctags
" Check the current directory, and then work up to the root, looking for tags
set tags+=./tags;/
" Open up function definitions in a vertical split
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Open up function definitions in a new tab
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR> 

" Auto Save/Reload VimViews
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Carriage Returns
nnoremap <cr> o<esc>
nnoremap <leader><cr> O<esc>

" Angular
nnoremap <leader>as :A<CR>

" Buffer Management
nnoremap <leader>bn :bnext<cr>
nnoremap <leader>bb :bprev<cr>
nnoremap <leader>bq :bdelete<cr>
nnoremap <leader>bx :w<cr>:bdelete<cr>
nnoremap <leader>b= :tab sball<cr>

" Clojure
nnoremap <leader>cc :!lein check<cr>
nnoremap <leader>cd :!lein deps<cr>
nnoremap <leader>cr :!lein deps<cr>

" EasyMotion
nnoremap  <leader>ff <Plug>(easymotion-sn)
omap      <leader>ff <Plug>(easymotion-tn)

" Git shortcuts
nnoremap <leader>gig :Gstatus<cr> " I use g for efficiency, this is the most common case
nnoremap <leader>gis :Gstatus<cr>
nnoremap <leader>gib :Gblame<cr>
nnoremap <leader>gid :Gdiff<cr>
nnoremap <leader>giv :Gvdiff<cr>
nnoremap <leader>gic :Gcommit<cr>
nnoremap <leader>giu :Gpull<cr>
nnoremap <leader>gip :Gpush<cr>
nnoremap <leader>gif :Ggrep 
nnoremap <leader>gil :Git lolas<cr>

" Grunt shortcuts
nnoremap <leader>grg :!grunt<cr>
nnoremap <leader>grt :!grunt test<cr>
nnoremap <leader>grc :!grunt compile<cr>
nnoremap <leader>grl :!grunt jshint<cr>

" Get Help
nnoremap <leader>h :help 

" Javascript
nnoremap <leader>jd :TernDoc<cr>
nnoremap <leader>jt :TernType<cr>
nnoremap <leader>jr :TernRefs<cr>

" Livescript
nnoremap <leader>lm :LiveScriptMake<cr>
nnoremap <leader>lc :LiveScriptCompile<cr>
nnoremap <leader>lr :LiveScriptRun<cr>

" Markdown shortcuts
nnoremap <leader>m- yyp^Vr-
nnoremap <leader>m= yyp^Vr=
nnoremap <leader>mh1 I# <esc>
nnoremap <leader>mh2 I## <esc>
nnoremap <leader>mh3 I### <esc>
nnoremap <leader>mh4 I#### <esc>

" Replace all tabs in the current file with space characters
nnoremap <leader>nt :retab<cr>

" Ctrlp
" | Fuzzy searching for project things
let g:ctrlp_extensions = ['tag']
nnoremap <leader>pp :CtrlPLastMode<cr> " Most common case
nnoremap <leader>pf :CtrlP<cr>        " Find a file
nnoremap <leader>pt :CtrlPTag<cr>     " Find tags in the project
nnoremap <leader>pb :CtrlPBuffer<cr>  " Find a term in the current buffer
nnoremap <leader>pr :CtrlPMRU<cr>     " Find a file in recent files

" Run the current file
nnoremap <leader>rb :! clear; chmod +x % && ./%
nnoremap <leader>rn :! clear; node %

" Surround text currently selected while in visual mode
" (The surrounded text is kept selected after being surround)
" Taken from [Ernesto García](https://coderwall.com/gnapse)
vmap <leader>s" S"lvi"
vmap <leader>s' S'lvi'
vmap <leader>s` S`lvi`
vmap <leader>s( S)lvi(
vmap <leader>s{ S}lvi{
vmap <leader>s[ S]lvi[
vmap <leader>s< S>lvi<

" Tag navigation
nnoremap <leader>tt <C-]>
nnoremap <leader>tu <C-t>

" Tabularize shortcut
noremap <leader>ta :Tabularize /

" Vimrc editing on the fly
nnoremap <leader>ve :vsplit $MYVIMRC<cr>
nnoremap <leader>vs :source $MYVIMRC<cr>

" Navigate window splits
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <leader>w <C-w>

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
" | don't do vim wrong
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Forget to sudo before editing a file?
cmap w!! w !sudo tee % >/dev/null

" Jump to end and begining of a line with ease
nnoremap H ^
nnoremap L $

" No more Ex mode
nnoremap Q <nop>

"================= Plugins =================="

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

" VimJavascript
" | Some highlighting for javascript
let javascript_enable_domhtmlcss=1    " Enables HTML/CSS syntax highlighting in your JavaScript file.
"let b:javaScript_fold=1               " Enables JavaScript code folding.
"let javascript_ignore_javaScriptdoc=0 " Disables JSDoc syntax highlighting
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
" | Go up or down the list? Go down
let g:SuperTabDefaultCompletionType    = '<C-n>'

" VimAirline
" | I Love this thing...once you figure out the damn fonts
" Enable the tab line when multiple files are opened
let g:airline#extensions#tabline#enabled  = 1
" Only show the filename in the buffer/tab bar
let g:airline#extensions#tabline#fnamemod = ':t'
" Yes, we have those damn fonts
let g:airline_powerline_fonts             = 1
" I really like this theme
let g:airline_theme                       = 'badwolf'

"===SCRATCH SPACE==="
" Anything below here is considered volatile

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
