execute pathogen#infect()
syntax enable
filetype plugin indent on

nmap ; :

colo gruvbox
"colo tomorrow-night
"colo nord
"let g:airline_theme = 'tomorrow'
"let g:airline_theme = 'nord'
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1

let mapleader = "\<Space>"

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
set cursorcolumn!
" Allow toggling of highlighter
nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>x :set cursorline!<CR>

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
"
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
autocmd BufWritePre *.rb :StripWhitespace
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
" project specific
let g:ctrlp_custom_ignore = 'node_modules/\|DS_Store/\|git/\|bower_components/\|vendor\|tmp\|db'
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

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g "" --ignore node_modules --ignore bundle --ignore DS_Store --ignore git --ignore bower_components --ignore vendor --ignore tmp --ignore db --ignore app/resources'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" utilisnips directory
let g:UltiSnipsSnippetDirectories=['UltiSnips']
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltisnipsJumpForwardTrigger='<tab>'
let g:UltisnipsJumpBackwardsTrigger = '<s-tab>'

" make You Complete Me compatible with Utilisnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>']
let g:ycm_key_list_previous_completion = ['<C-k>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" RSpec.vim with dispatch and zeus
"let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"

" RSpec.vim with distpatch and fuck zeus
let g:rspec_command = "Dispatch rspec {spec}"

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

" Only lint on file save(for big files)
"let g:ale_lint_on_text_changed = 'never'

" Keep the gutter always open for linting
let g:ale_sign_column_always = 1
" Custome Ale status line config
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']
