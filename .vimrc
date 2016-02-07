" if current buffer has never been saved it will have no name.
" call the file browser to save, otherwise just modify
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-u>Update<CR>

execute pathogen#infect()
syntax enable
filetype plugin indent on

nmap ; :

colo tomorrow-night

let g:airline_powerline_fonts = 1

let mapleader = "\<Space>"

" Select a word in visial mode then double tap '/' for a search
vnoremap // y/<C-R>"<CR>"

" vim nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" vim crosshairs
hi CursorLine   cterm=NONE ctermbg=235
hi CursorColumn cterm=NONE ctermbg=235

nnoremap <Leader>x :set cursorline! cursorcolumn!<CR>
set nu
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set tags=./tags;~/Projects

" Trim whitespace on save in ruby
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.js :%s/\s\+$//e

" ctrlp custom configurations
" let g:ctrlp_max_files=100000
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:15,results:50'
let g:ctrlp_working_path_mode = 'a'
" project specific
" let g:ctrlp_custom_ignore = 'node_modules/\|DS_Store/\|git/\|bower_components/\|vendor\|tmp\|db'

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

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_runner = "os_x_iterm2"

" :'<,'>w !pbcopy (map this to something for easy copy paste)
