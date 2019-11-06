set nocompatible              " Requis
filetype off                  " Requis

" Dossier vim-plug
call plug#begin(expand('~/.vim/plugged'))
Plug 'morhetz/gruvbox'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'towolf/vim-helm'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'justinmk/vim-sneak'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
call plug#end()

" Pour des mappings spécifiques BÉPO
source ~/.config/nvim/bepo.vim

filetype plugin on
filetype plugin indent on

" Plein de défauts bien pratiques (à garder en début de fichier)
set nocompatible
set number
set exrc
set secure
set mouse=
set showmatch
set backspace=indent,eol,start

" Coloration syntaxique avec gruvbox
let python_highlight_all=1
syntax enable
colorscheme gruvbox

" Jolie barre de statut (airline)
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
set guifont=Inconsolata\ for\ Powerline\ 14
set laststatus=2

" Configuration de l'indentation
set preserveindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set cinoptions=l1

" Undo persistent
set undodir=~/.vim/undodir
set undofile

" Copy/Paste dans le buffer externe
set clipboard+=unnamed

" Des helpers YAML
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Permet de copier du texte sans que l'indentation parte en couille
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Extension des fichiers pour l’auto indentation
if has("autocmd")
  filetype indent on
endif

" Encodage
set encoding=utf-8
setglobal fileencoding=utf-8
set fileencodings=utf-8

" Buffers
set hidden

" Syntastic
nnoremap <leader>c :SyntasticCheck<CR>
let g:syntastic_python_python_exec = '/usr/bin/python'
let g:syntastic_python_flake8_exec = 'python'
let g:syntastic_python_flake8_args = ['-m', 'flake8']
let g:syntastic_python_checkers = ['flake8', 'py3kwarn']

"split
set splitbelow
set splitright

" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Afficher les espaces en trailing et les espaces insécables
set listchars=tab:\ \ ,trail:◃,nbsp:•
set list

" Ctags
let g:easytags_async=1

" Isort (imports Python)
let g:vim_isort_python_version = 'python3'
let g:vim_isort_map = '<C-é>'
nmap <C-é> :Isort<CR>

" Sneak (meilleure gestion du go to character)
let g:sneak#s_next = 1
map f <Plug>Sneak_f
map F <Plug>Sneak_F
map j <Plug>Sneak_t
map J <Plug>Sneak_T
map è <Plug>Sneak_s
map È <Plug>Sneak_S
map , <Plug>Sneak_;
map ; <Plug>Sneak_,

" Terraform
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

" Go mappings
nmap <leader>i :GoInfo<CR>
nmap <leader>d :GoDef<CR>
let g:tagbar_map_togglesort = "z"
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" coc.nvim

" désactiver le raccourci vim-go :GoDef (gd)
" c’est désormais géré par LanguageClient [LC]
let g:go_def_mapping_enabled = 0

set hidden
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Utilise <c-space> pour activer la completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Utilise `[c` and `]c` pour naviguer à travers les diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Mappings GoTos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" FZF sur CTRL-P (habitude du plugin ctrlp)
nmap <C-p> :FZF<CR>

" tags
set tags=~/Work/src/gitlab.com/Misakey/tags;
