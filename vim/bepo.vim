" {W} -> [É]
" ——————————
" On remappe W sur É :
noremap é w
noremap É W

" Corollaire, pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
" (attention, cela diminue la réactivité du {A}…)
noremap aé aw
noremap aÉ aW

" Pour faciliter les manipulations de fenêtres, on utilise {à} comme un Ctrl+W :
noremap à <C-w>
noremap À <C-w><C-w>

" Modification du redo
nnoremap <C-y> <C-r>

" [HJKL] -> {CTSR}
" ————————————————
" {cr} = « gauche / droite »
noremap t h
noremap n l
" {ts} = « haut / bas »
noremap s k
noremap r j
" {CR} = « haut / bas de l'écran »
noremap T H
noremap N L
" {TS} = « joindre / aide »
noremap R J
noremap S K
" Corollaire : repli suivant / précédent
noremap zr zj
noremap zs zk

" Recherche
noremap m n
noremap M N
 
" {HJKL} <- [CTSR]
" ————————————————
" {J} = « Jusqu'à »            (j = suivant, J = précédant)
noremap j t
noremap J T
" {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
noremap l c
noremap L C
" {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
noremap h r
noremap H R
" {K} = « Substitue »          (k = caractère, K = ligne)
noremap k s
noremap K S
" Corollaire : correction orthographique
noremap ]k ]s
noremap [k [s
 
" Désambiguation de {g}
" —————————————————————
" ligne écran précédente / suivante (à l'intérieur d'une phrase)
noremap gs gk
noremap gt gj
" onglet précédant / suivant
noremap gb gT
noremap gé gt
" optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
noremap gB :exe "silent! tabfirst"<CR>
noremap gÉ :exe "silent! tablast"<CR>
" optionnel : {g"} pour aller au début de la ligne écran
noremap g" g0
 
" <> en direct
" ————————————
noremap « <
noremap » >
 
" Remaper la gestion des fenêtres
" ———————————————————————————————
noremap àr <C-w>j
noremap às <C-w>k
noremap àt <C-w>h
noremap àn <C-w>l
noremap àd <C-w>c
noremap ào <C-w>s
noremap àp <C-w>o
noremap à<SPACE> :split<CR>
noremap à<CR> :vsplit<CR>

noremap . m

" Page up et page down
" ———————————————————————————————
noremap wr <PageDown>
noremap ws <PageUp>

" Fugitive
" ———————————————————————————————
nnoremap gdr :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

let g:go_def_mapping_enabled = 0

" Remap la gestion des tags
nnoremap <leader>d <C-]>
nnoremap <leader>. <C-t>

" Remap les commandes de completion
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : "\<C-n>"
inoremap <expr> <C-j> pumvisible() ? "\<C-p>" : "\<C-j>"
inoremap <expr> <C-s> pumvisible() ? "\<C-y>" : "\<C-s>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Raccourcis
let mapleader=" "
nmap <leader>q :NERDTreeToggle<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>p :ProjectRootCD<CR>
nnoremap <leader>g :ProjectRootExe grep<space>
nnoremap <silent> <leader>n :ProjectRootExe NERDTreeFind<cr>
nnoremap <expr> <leader>e ':edit '.projectroot#guess().'/'
nmap <C-f> <C-]>
nmap <c-n> :bnext<CR>
nmap <c-t> :bprevious<CR>
imap jj <Esc>
nmap du :wincmd w<cr>:normal u<cr>:wincmd w<cr>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>s :Ag<CR>
