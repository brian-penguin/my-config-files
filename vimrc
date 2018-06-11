syntax enable
filetype plugin indent on

nmap ; :

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Async Linting engine
Plug 'w0rp/ale'

" Vim Language Pack
Plug 'sheerun/vim-polyglot'
" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Use tab for all insert completion
Plug 'ervandew/supertab'

" Nice defaults to get started
Plug 'tpope/vim-sensible'
" Pair open quotes and brackets etc
Plug 'jiangmiao/auto-pairs'
" Use editorconfig file for formatting when available
Plug 'editorconfig/editorconfig-vim'
" Pretty baseline
Plug 'vim-airline/vim-airline'
" Best commentor
Plug 'scrooloose/nerdcommenter'
" Used with Git ls to fuzzy find files
Plug 'ctrlpvim/ctrlp.vim'
" line highlighting (Look into just doing this myself)
Plug 'bronson/vim-crosshairs'
" Paste without escape chars
Plug 'ConradIrwin/vim-bracketed-paste'
" StripWhitespace on save for specific file typpes
Plug 'ntpeters/vim-better-whitespace'
" Jumping around in a fun and fast way
Plug 'easymotion/vim-easymotion'
" Run Specs from Vim
Plug 'thoughtbot/vim-rspec'
" Send them to the background
Plug 'tpope/vim-dispatch'
" Change the surrounding brackets and quotes
Plug 'tpope/vim-surround'
" Git for vim!
Plug 'tpope/vim-fugitive'
" Auto add end to blocks
Plug 'tpope/vim-endwise'
" Show changes in the gutter
Plug 'airblade/vim-gitgutter'
" :Explore to travel dirs
Plug 'jlanzarotta/bufexplorer'
" Autoindent lines please
Plug 'Yggdroot/indentLine'

" Org Mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'

" RUST
Plug 'sebastianmarkow/deoplete-rust'
Plug 'racer-rust/vim-racer'

" JS
Plug 'carlitux/deoplete-ternjs'

" Elixir
Plug 'slashmili/alchemist.vim'
Plug 'mhinz/vim-mix-format'

" Colorschemes
Plug 'rakr/vim-one'
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'reedes/vim-colors-pencil'
call plug#end()


" Set the SWP directory to be this tempfile directory
" so autobuild stuff doesn't register the swp file
set directory^=$HOME/.vim/tmp//

" Macvim
" hide mouse while typing
set mousehide
" gui font
set guifont=Hack:h13
"set guifont=InputMonoCondensed:h12
" bye scrollbars
set guioptions-=r
set guioptions-=L

"Gruvbox Theme settings
"set background=dark
"colo gruvbox
"let g:gruvbox_contrast = 'hard'
"let g:airline_theme = 'gruvbox'
"
"Nord Theme settings
"set background=dark
"colo nord
"let g:airline_theme = 'nord'

" ONE ViM colors
set background=light
colo one
let g:airline_theme = 'one'

" Pencil Color Theme Settings (good for outside)
"set background=light
"colo pencil
"let g:pencil_higher_contrast_ui = 0
"let g:airline_theme = 'pencil'

let g:airline_powerline_fonts = 1

let mapleader = "\<Space>"

" Line Formatting for indented spaces
let g:indentLine_enabled = 0

" DEOCOMPLETE (Neocomplete replacement)
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
let g:SuperTabDefaultCompletionType = "<c-n>"
" Setup for omnicompletion
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

" Plugin key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction

" NOT USED (NEOCOMPLETE)
"inoremap <expr><C-g>     neocomplete#undo_completion()
"inoremap <expr><C-l>     neocomplete#complete_common_string()

" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
"inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
"inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
"
" Set minimum syntax keyword length.
"let g:neocomplete#sources#syntax#min_keyword_length = 3

"Elixir stuff
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" Diable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
noremap Q <nop>

" Move by visual line(ie wraps not literal lines)
nnoremap j gj
nnoremap k gk

" Select a word in visial mode then double tap '/' for a search
vnoremap // y/<C-R>"<CR>"

" For when experiencing slow vim syntax highlighting with large ruby files
set re=1
set ttyfast
set lazyredraw

" Turn on cursor highlighting by default
set cursorline!
"set cursorcolumn!
" Allow toggling of highlighter
nnoremap <Leader>x :set cursorline! <CR>
"nnoremap <Leader>x :set cursorline!<CR>

" Don't fold code by default and don't fold all of then with za
set nofoldenable
set foldlevelstart=99

set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set nojoinspaces
set hlsearch
set autoread
set tags=./tags;~/Projects

" Below is for more natural window splits
set splitbelow
set splitright

" Don't jump to first character in line
"set nostartofline
" Show next 3 lines while scrolling
if !&scrolloff
  set scrolloff=10
endif
" Show next 5 columns while side-scrolling
if !&sidescrolloff
  set sidescrolloff=5
endif

" Using BufExplorer
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Trim whitespace on save
"autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.clj :StripWhitespace
autocmd BufWritePre *.rb :StripWhitespace
autocmd BufWritePre *.rs :StripWhitespace
autocmd BufWritePre *.rake :StripWhitespace
autocmd BufWritePre *.js :StripWhitespace
autocmd BufWritePre *.txt :StripWhitespace
autocmd BufWritePre *.md :StripWhitespace
autocmd BufWritePre *.ex :StripWhitespace
autocmd BufWritePre *.exs :StripWhitespace
autocmd BufWritePre *.json :StripWhitespace
autocmd BufWritePre *.go :StripWhitespace
autocmd BufWritePre *.rc :StripWhitespace
autocmd BufWritePre *.html* :StripWhitespace
autocmd BufWritePre *.css :StripWhitespace
autocmd BufWritePre *.sass :StripWhitespace
autocmd BufWritePre *.scss :StripWhitespace
autocmd BufWritePre *.sh :StripWhitespace
autocmd BufWritePre *.py :StripWhitespace
autocmd BufWritePre *.vim* :StripWhitespace

" Easy Json Formating
" use :FormatJson()
com FormatJson %!python -m json.tool

" AG ignore list
" Just use a project level .agignore and keep any files you want in it
" All .agignore files are ignored by git globally

" ctrlp custom configurations
" let g:ctrlp_max_files=100000
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_working_path_mode = 'a'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](doc|tmp|node_modules|git|bower_components|vendor|tmp|db|deps)',
      \ 'file': '\v\.(exe|so|dll|DS_Store|tags)$',
      \ }
let g:ctrlp_user_command = {
      \ 'types': {
      \ 1: ['.git', 'cd %s && git ls-files'],
      \ 2: ['.hg', 'hg --cwd %s locate -I .'],
      \ },
      \ 'fallback': 'find %s -type f'
      \ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" TODO: This isn't great, we should just use the defined args above
nnoremap \ :Ag<SPACE>

" utilisnips directory
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<tab>'
let g:UltisnipsJumpBackwardsTrigger = '<s-tab>'

" make You Complete Me compatible with Utilisnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-j>']
"let g:ycm_key_list_previous_completion = ['<C-k>']
"let g:SuperTabDefaultCompletionType = '<C-j>'

" RSpec.vim with distpatch
let g:rspec_command = 'Dispatch rspec {spec}'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

" fugitive git bindings
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

" italic comments! https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
highlight Comment cterm=italic

" enable extensions for airline
let g:airline#extensions#ale#enabled = 1
" Only lint on file save(for big files)
let g:ale_lint_on_text_changed = 'never'
" Keep the gutter always open for linting
let g:ale_sign_column_always = 1
" Custome Ale status line config
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" TERN config
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'ts',
                \ 'tsx',
                \ ]
