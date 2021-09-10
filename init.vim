syntax enable
filetype plugin indent on

nmap ; :

call plug#begin('~/.vim/plugged')

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

" Vim Language Pack
Plug 'sheerun/vim-polyglot'

" A Newer Multi-entry selection UI purpose built for nvim >0.5
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" A Neovim 0.5> linter
Plug 'mfussenegger/nvim-lint'

" A Neovim 0.5> LSP plugin
Plug 'neovim/nvim-lspconfig'

" A Neovim 0.5>
Plug 'hrsh7th/nvim-compe'

" Supertab for tab complete
Plug 'ervandew/supertab'

" Use ripgrep for search
Plug 'jremmen/vim-ripgrep'

" Nice defaults to get started
Plug 'tpope/vim-sensible'
" Use Tmux and Vim seemlessly see:
" https://robots.thoughtbot.com/seamlessly-navigate-vim-and-tmux-splits
Plug 'christoomey/vim-tmux-navigator'

" Pair open quotes and brackets etc
Plug 'jiangmiao/auto-pairs'
" Extended % matching
Plug 'https://github.com/adelarsq/vim-matchit'

" Use editorconfig file for formatting when available
Plug 'editorconfig/editorconfig-vim'
" Pretty baseline
Plug 'vim-airline/vim-airline'
" Best commentor
Plug 'preservim/nerdcommenter'

" line highlighting (Look into just doing this myself)
Plug 'bronson/vim-crosshairs'
" Paste without escape chars
Plug 'ConradIrwin/vim-bracketed-paste'
" StripWhitespace on save for specific file typpes
Plug 'ntpeters/vim-better-whitespace'
" Jumping around in a fun and fast way
" Plug 'easymotion/vim-easymotion'
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

" RUBY
" Run Specs from Vim
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }

"Colorschemes
Plug 'rakr/vim-one'
Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'morhetz/gruvbox'
" Plug 'arcticicestudio/nord-vim'
" Plug 'reedes/vim-colors-pencil'
call plug#end()


" Writing Mode
Plug 'junegunn/goyo.vim'
call plug#end()

" Set the SWP directory to be this tempfile directory
" so autobuild stuff doesn't register the swp file
set directory^=$HOME/.vim/tmp//

""""""""""""""
" Theme
""""""""""""""
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
let maplocalleader =","

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
"set re=1
"set ttyfast
"set lazyredraw

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

fun! TrimWhitespace()
  let l:save = winsaveview()
 keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! JumpToLastLine()
  if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    exe "normal g`\"" |
  endif
endfun

augroup vimrcEx
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
  autocmd BufReadPost * :call JumpToLastLine()
  autocmd BufWritePost *.rb lua require('lint').try_lint()
augroup END

augroup Markdown
  autocmd!
  autocmd FileType markdown setlocal wrap
  autocmd FileType markdown setlocal spell
  autocmd FileType markdown setlocal complete+=kspell
augroup END

augroup Gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal wrap
  autocmd FileType gitcommit setlocal spell
  autocmd FileType gitcommit setlocal complete+=kspell
augroup END

"""""""""""""""""""
" Goyo
"""""""""""""""""""
let g:goyo_width = 120


"""""""""""""""""""""
"    AutoPairs      "
"""""""""""""""""""""
let g:AutoPairsMultilineClose = 0
let g:AutoPairsOnlyWhitespace = 1


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

"
" """"""""""""""""""""""""
" telescope nvim
" https://github.com/nvim-telescope/telescope.nvim
""""""""""""""""""""""""
" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Config for telescope. Use a compiled version of fzy for fastness
lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    prompt_prefix = " > ",
    file_sorter =  require'telescope.sorters'.get_fzy_sorter,
    color_devicons = true,
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
        },
      },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
        }
      }
  }
}
-- Use native fzy instead
require('telescope').load_extension('fzy_native')

-- For  nvim-lint
require('lint').linters_by_ft = {
  ruby = {'standardrb',}
}

-- For LSP with Ruby
require'lspconfig'.solargraph.setup{
  useBundler = true;
  -- Testing a debounce to see if that make solargraph happier
  flags = {
    debounce_text_changes = 100
  }
}
require'lspconfig'.tsserver.setup{}

-- For Completion engine
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'disable';
  throttle_time = 80;
  source_timeout = 200;
  resolve_timeout = 800;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = false;
    ultisnips = false;
  };
}

EOF

" """"""""""""""""""""""""
" nvim-lint
" https://github.com/lispyclouds/nvim-lint
""""""""""""""""""""""""
" I have this running in a buffer hook only for ruby files currently
"au BufWritePost <buffer> lua require('lint').try_lint()


" """"""""""""""""""""""""
" super tab
""""""""""""""""""""""""
let g:SuperTabDefaultCompletionType = "<c-n>"


" lsp config
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
nnoremap <leader>fd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>fi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>fr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>fsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>fh :lua vim.lsp.buf.hover()<CR>
