call plug#begin('~/.vim/plugged')
" --------------------------------------------------------------------------

" Colorscheme -----------------------------------------------------------
Plug 'kaicataldo/material.vim', { 'branch': 'main' }


" Sidebar File Manager ----------------------------------------------------
Plug 'preservim/nerdtree'
" leader+q for open the file manager
map <leader>q :NERDTreeToggle<CR>


" Command Line Fuzzy Finder -----------------------------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" leader+f for opens files
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>c :Commits<CR>
nmap <leader>cb : BCommits<CR>
nmap <leader>g :GFiles?<CR>


" Git Wrapper for Vim ------------------------------------------------------
Plug 'tpope/vim-fugitive'


" Quick Surrounding Tags ----------------------------------------------------
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'


" CoC completion with LSP suppport -------------------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" install global extensions and language client
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-tailwindcss', 'coc-yaml']

" conditional install based on the dependencies is there
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif

if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif

" Set the code action for CoC - for spell checker
nmap <leader>a  <Plug>(coc-codeaction)

" tool tip documentation and diagnostics


" TypeScript and JavaScript ---------------------------------------------------
Plug 'pangloss/vim-javascript'         " JavaScript support
Plug 'peitalin/vim-jsx-typescript'     " TypeScript support
Plug 'maxmellon/vim-jsx-pretty'        " JS,JSX syntax
Plug 'leafgarland/typescript-vim'      " TS, TSx syntax
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }



" Status/ Tabline Bottom -------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" air-line
let g:airline_powerline_fonts = 1      " Use Powerline font
let g:airline_theme='cobalt2'          " Set Cobalt 2 Theme

if !exists('g:airline_symbols')        " Reset the symbol
    let g:airline_symbols = {}
endif


"--------------------------------------------------------------------------


call plug#end()


" Set Space as leader key
nmap <space> <leader>


" Indentation Options
set expandtab                  " convert tabs to spaces
filetype plugin indent on      " Enable indentation rules that are file-type specific
filetype plugin on
set tabstop=2                  " Indent using two spaces
set shiftwidth=2 
set autoindent                 " New lines inherit the indentation of previous lines

" Text Rendering Options
syntax enable                  " Enable syntax hightlighting
set wrap                       " Enable line wrapping
set linebreak                  " Avoid wrapping a line in the middle of a word
set encoding=utf-8             " Use an encoding that supports unicode
set scrolloff=5                " The number of screen lines to keep above and below the cursor
set updatetime=300             " Longer updatetime

" User Interface Options
set nocompatible
set mouse=a                    " Enable mouse usage (all modes)
set number                     " Show line numbers on the sidebar
set ruler                      " Always show cursor position - bottom right
set signcolumn=auto:1
highlight clear SignColumn     " Remove the gray area (sign column)

" Code Folding Options
" set foldmethod=syntax          " Fold based on indentition levels
" set foldnestmax=2              " Fold up to three nested levels


" Some servers have issues with backup files, see #649.
set nobackup
set noswapfile
set nowritebackup


" Normal mode non-recursive mapping
" Go to the beginning of line
nnoremap B ^
" Go to the end of line
nnoremap E $
" Delete to the end of line
nnoremap D d$
" Copy the text from the cursor pos to the end of line
nnoremap Y yy
" Open All Fold
nnoremap <leader>, zR<CR>
" Close all Fold
nnoremap <leader>. zM<CR>
" Quick save (if modified) and quit
nnoremap <leader>w :w<CR>
" Quick sav
nnoremap <leader>x :x<CR>


" Colorscheme and True Colors
let g:material_terminal_italics = 1
let g:material_theme_style = 'palenight'
colorscheme material 
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
set background=dark
set termguicolors
