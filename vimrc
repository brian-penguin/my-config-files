syntax enable
filetype plugin indent on

nmap ; :

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'elmcast/elm-vim'

" Vim Language Pack
Plug 'sheerun/vim-polyglot'
" Disable the polygot version of elm
let g:polyglot_disabled = ['elm', 'scala']

" Async Linting engine
Plug 'w0rp/ale'

" Language server
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
" This will link the brew sym-linked fzf used in commandline
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

" Use tab for all insert completion
Plug 'ervandew/supertab'

" Nice defaults to get started
Plug 'tpope/vim-sensible'
" Use Tmux and Vim seemlessly see:
" https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plug 'christoomey/vim-tmux-navigator'

" Pair open quotes and brackets etc
Plug 'jiangmiao/auto-pairs'
" Use editorconfig file for formatting when available
Plug 'editorconfig/editorconfig-vim'
" Pretty baseline
Plug 'vim-airline/vim-airline'
" Best commentor
Plug 'scrooloose/nerdcommenter'

" line highlighting (Look into just doing this myself)
Plug 'bronson/vim-crosshairs'
" Paste without escape chars
Plug 'ConradIrwin/vim-bracketed-paste'
" StripWhitespace on save for specific file typpes
Plug 'ntpeters/vim-better-whitespace'
" Jumping around in a fun and fast way
Plug 'easymotion/vim-easymotion'
" Send commands to shell in the background
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
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

"Emacs-esque org mode
Plug 'jceb/vim-orgmode'

" RUBY
" Run Specs from Vim
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

" RUST
Plug 'sebastianmarkow/deoplete-rust', { 'for': 'rust' }
Plug 'racer-rust/vim-racer', { 'for': 'rust' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" JS
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'typescript'] }

" Elixir
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }

" Scala
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
"Set config for sbt as well
au BufRead,BufNewFile *.sbt set filetype=scala

"Clojure
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'venantius/vim-cljfmt', { 'for': 'clojure' }
"
" A markdown previewer -> :MarkdownPreview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

"Colorschemes
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'reedes/vim-colors-pencil'
call plug#end()


" Set the SWP directory to be this tempfile directory
" so autobuild stuff doesn't register the swp file
set directory^=$HOME/.vim/tmp//

""""""""""""""""""""""
" Macvim
" """"""""""""""""""""

" hide mouse while typing
set mousehide
" gui font
set guifont=Hack:h13
"set guifont=InputMonoCondensed:h12
" bye scrollbars
set guioptions-=r
set guioptions-=L

""""""""""""""
" Theme
""""""""""""""

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

"set background=dark
"colo dracula
"let g:airline_theme = 'dracula'

let g:airline_powerline_fonts = 1


""""""""""""""""
" Defaults "
"""""""""""""""
let mapleader = "\<Space>"

" Line Formatting for indented spaces
let g:indentLine_enabled = 0

" Disable arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
noremap Q <nop>

" Auto resize panes when host is re-drawn see:
" https://vi.stackexchange.com/questions/201/make-panes-resize-when-host-window-is-resized
autocmd VimResized * wincmd =

" Use relative line numbers
set relativenumber

" Move by visual line(ie wraps not literal lines)
nnoremap j gj
nnoremap k gk

" Select a word in visial mode then double tap '/' for a search
vnoremap // y/<C-R>"<CR>"

" For when experiencing slow vim syntax highlighting with large ruby files
set re=1
set ttyfast
set lazyredraw

" Set the title bar
set title

" Turn on cursor highlighting by default
set cursorline!
set cursorcolumn!
" Allow toggling of highlighter
nnoremap <Leader>x :set cursorline! <CR>

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
set tags=./tags;~/Projects;tags

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

" Easier window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" italic comments! https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
highlight Comment cterm=italic gui=italic

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

""""""""""""""""""""""""
"" DEOCOMPLETE (Neocomplete replacement)
""""""""""""""""""""""""
let g:deoplete#enable_at_startup = 1
" deoplete tab-complete
let g:SuperTabDefaultCompletionType = "<c-n>"
" Setup for omnicompletion
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

""""""""""""""""""""""""""""""""""
"FZF config
" """"""""""""""""""""""""""""""""""""
" Customize fzf colors to match your color scheme
" Use Ctrl-p for fzf now
nnoremap <silent> <C-p> :FZF<CR>

" Match colors env
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Plugin key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
"
" make fzf status line use the vim theme colors
function! s:fzf_statusline()
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()


""""""""""""""""""""
"Elixir stuff
""""""""""""""""""""""
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

""""""""""""""""""""
"ELM stuff
""""""""""""""""""""""
let g:elm_format_autosave = 1

" """"""""""""""""""""
" BufExplorer
" """"""""""""""""""""""""
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>


" """""""""""""
" Easy Json Formating
" """"""""""""""""
" use :FormatJson()
com FormatJson %!python -m json.tool


" """"""""""""""""""""""
" The Silver Searcher
" """"""""""""""""""""""""
if executable('ag')
  " Use rg over grep
  set grepprg=ag
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
" TODO: This isn't great, we should just use the defined args above
nnoremap \ :Rg<SPACE>


"""""""""""""""""""""
"    AutoPairs      "
"""""""""""""""""""""
let g:AutoPairsMultilineClose = 0
let g:AutoPairsOnlyWhitespace = 1


" """"""""""""""""""""""""""""""""
" utilisnips directory
""""""""""""""""""""""""""""""""""""
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<tab>'
let g:UltisnipsJumpBackwardsTrigger = '<s-tab>'


" """"""""""""""""""""
" RSPEC Config
" """"""""""""""""""""""
" RSpec.vim with distpatch
let g:rspec_command = 'Dispatch bin/rspec {spec}'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"


" """"""""""""""""""""""""
" fugitive git
""""""""""""""""""""""""
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


" """"""""""""""""""""""""""""
" ALE
" """"""""""""""""""""""""""""""
" enable extensions for airline
let g:airline#extensions#ale#enabled = 1
" Uncomment when you only lint on file save(for big files)
" let g:ale_lint_on_text_changed = 'never'

" Keep the gutter always open for linting
let g:ale_sign_column_always = 1
" Custome Ale status line config
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Only use standardrb for linting
let g:ale_linters = { 'ruby': ['standardrb'] }
"
" Autofix fixable errors
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['standardrb'],
\   'javascript': ['eslint'],
\   'elm': ['elm-format'],
\}
let g:ale_fix_on_save = 1


" """"""""""""""""""""""
" TERN config
""""""""""""""""""""""""
let g:deoplete#sources#ternjs#timeout = 1
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'ts',
                \ 'tsx',
                \ ]



" """"""""""""""""""""""""""""""""""
" Rust
" """"""""""""""""""""""""""""""""""
" May be the same as ale_fix_on_save
let g:autofmt_autosave = 1
let g:rustfmt_autosave = 1
let g:rust_clip_command = 'pbcopy'
" Use racers experimental completer
let g:racer_experimental_completer = 1


" """"""""""""""""""""""""""""""
" LanguageClient Server
" """"""""""""""""""""""""""""""
" a basic set up for LanguageClient-Neovim
" << LSP >> {{{

let g:LanguageClient_autoStart = 0
nnoremap <leader>lcs :LanguageClientStart<CR>

" if you want it to turn on automatically
" let g:LanguageClient_autoStart = 1

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'javascript': ['javascript-typescript-stdio'] }

noremap <silent> H :call LanguageClient_textDocument_hover()<CR>
noremap <silent> Z :call LanguageClient_textDocument_definition()<CR>
noremap <silent> R :call LanguageClient_textDocument_rename()<CR>
noremap <silent> S :call LanugageClient_textDocument_documentSymbol()<CR>
" }}}
