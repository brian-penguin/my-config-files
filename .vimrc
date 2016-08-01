execute pathogen#infect()
syntax enable
filetype plugin indent on

nmap ; :

colo tomorrow-night
let g:airline_theme = 'tomorrow'
let g:airline_powerline_fonts = 1

let mapleader = "\<Space>"

" Select a word in visial mode then double tap '/' for a search
vnoremap // y/<C-R>"<CR>"

" vim nerdtree
map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim crosshairs
" Uncomment for a red and black hightlighting
"hi CursorLine cterm=NONE ctermbg=darkred ctermfg=NONE guibg=black guifg=NONE
"hi CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE

" Turn on cursor highlighting by default
set cursorline!
"set cursorcolumn!
" Allow toggling of highlighter
"nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
nnoremap <Leader>x :set cursorline!<CR>

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
  set scrolloff=5
endif
" Show next 5 columns while side-scrolling
if !&sidescrolloff
  set sidescrolloff=5
endif

" Trim whitespace on save in ruby
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

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

" The Silver Searcher
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

" RSpec.vim with dispatch and zeus
let g:rspec_command = "compiler rspec | set makeprg=zeus | Make rspec {spec}"
"
" RSpec.vim with distpatch and fuck zeus 
"let g:rspec_command = "Dispatch rspec {spec}"

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
nnoremap <Leader>gp :Ggrep<Spaaaaaace>
nnoremap <Leader>gm :Gmove<Spaaaaaace>
nnoremap <Leader>gb :Git branch<Spaaaaaace>
nnoremap <Leader>go :Git checkout<Spaaaaaace>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

" Easier window split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
