" Where vim packages will be installed
call plug#begin('~/.vim/plugged')

" Install plugins
" some sensible defaults we can all agree on
Plug 'tpope/vim-sensible'
Plug 'ntpeters/vim-better-whitespace'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-dispatch'
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'arcticicestudio/nord-vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdcommenter'

call plug#end()

" Auto Syntax and indents
syntax enable
filetype plugin indent on

" No need to press shift
nmap ; :

" Space Leader!
let mapleader = "\<Space>"


colo nord
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1

" Select a word in visial mode then double tap '/' for a search
vnoremap // y/<C-R>"<CR>"

" For when experiencing slow vim syntax highlighting with large ruby files
set re=1
set ttyfast
set lazyredraw

" Turn on cursor highlighting by default
set cursorline!
set cursorcolumn!
" Allow toggling of highlighter
nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>

" Some defaults
set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces
set hlsearch
set autoread
set tags=./tags;~/Projects


" Don't jump to first character in line
"set nostartofline
" Show next 3 lines while scrolling
if !&scrolloff
  set scrolloff=5
endif
" Show next 5 columns while side-scrolling
if !&sidescrolloff
  set sidescrolloff=5
endif

" Trim whitespace on save
autocmd BufEnter * EnableStripWhitespaceOnSave

" Easy Json Formating
" use :FormatJson()
" Currently not installed
"com FormatJson %!python -m json.tool

" ctrlp custom configurations
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_working_path_mode = 'a'
" project specific
let g:ctrlp_custom_ignore = 'node_modules/\|DS_Store/\|git/\|bower_components/\|vendor\|tmp\|db'

" The Silver Searcher
" AG ignore list
" Just use a project level .agignore and keep any files you want in it
" All .agignore files are ignored by git globally
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore node_modules --ignore DS_Store --ignore git --ignore bower_components --ignore vendor --ignore tmp --ignore db --ignore app/resources'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" make You Complete Me compatible with Utilisnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" utilisnips directory
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<tab>'
let g:UltisnipsJumpBackwardsTrigger = '<s-tab>'

" Vim fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

" Easier window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" ALE config
" Keep the gutter always open for lints
let g:ale_sign_column_always = 1
" Custome Ale status line config
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

