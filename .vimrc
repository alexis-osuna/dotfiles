syntax on

set nu
set nowrap
set smartindent
set hidden
set expandtab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartcase
set noerrorbells
set noswapfile
set nobackup 
set incsearch
set encoding=UTF-8

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'sainnhe/gruvbox-material'

call plug#end()

set guifont=Hack\ Nerd\ Font:h12

if has('termguicolors') 
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:gruvbox_material_palette = 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_bold = 0
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_cursor = 'auto'
let g:gruvbox_material_visual = 'reverse'
let g:gruvbox_material_better_performance = 1
let g:gruvbox_material_current_word = 'bold'
let g:gruvbox_material_transparent_background = 1

set background=dark

colorscheme gruvbox-material

let mapleader = " "

set cmdheight=2
set updatetime=300
set shortmess+=c

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <C-space> coc#refresh()

if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <Leader>f :Files<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <Leader>rg :Rg<SPACE>

nmap <leader>gs :G<CR>

map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>u :UndotreeToggle<CR>

let g:airline_theme = 'gruvbox_material'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_right_sep = ''

set noshowmode
set showtabline=2

let g:startify_lists = [
        \ { 'type': 'files',     'header': ['   Recent Files']            },
        \ { 'type': 'dir',       'header': ['   '. getcwd()] },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ ]
let g:startify_session_dir = '~/.vim/plugged/vim-startify/sessions'
let g:startify_custom_header = [
        \ '                             ',
        \ '      ██    ██ ██ ███    ███ ',
        \ '      ██    ██ ██ ████  ████ ',
        \ '      ██    ██ ██ ██ ████ ██ ',
        \ '       ██  ██  ██ ██  ██  ██ ',
        \ '        ████   ██ ██      ██ ',
        \ '                             ',
        \ ]

map <C-v> "+P
nnoremap U <C-r>
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>w :wincmd w<CR>
nnoremap <leader>x :wincmd v<CR>
nnoremap <leader>y :wincmd s<CR>
nnoremap <leader>o :wincmd o<CR>
nnoremap <leader>d :bd<CR>
nnoremap <leader>t :below terminal ++rows=10<CR>
inoremap ii <ESC>
vnoremap <C-c> "+y
vnoremap <leader>s y/\V<C-R>=escape(@",'/\')<CR><CR>N
tnoremap <C-n> <C-\><C-n>
