" Keep current color settings
syntax enable
" Turn on detection, plugin, and indent
filetype plugin indent on
" Fish syntax checking
call plug#begin('~/.vim/plugged')
" Language server
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Theme
Plug 'drewtempelmeyer/palenight.vim'
" File explorer
Plug 'preservim/nerdtree'
" Icons for file explorer
Plug 'ryanoasis/vim-devicons'
" Color icons for file explorer
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Automatically add bracket pairs
Plug 'LunarWatcher/auto-pairs', { 'tag': '*' }
" Statusline
Plug 'ourigen/skyline.vim'
" Visual indicator of indents
Plug 'Yggdroot/indentLine'
" Indent lines even if there's nothing there (addon)
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()
" Custom escape keybind
inoremap hzh <Esc>
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Move around windows
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h
" CTRL-N to toggle Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Save+Exit and convert tabs to spaces
nnoremap <C-s> :retab<ENTER>:xa<CR> 
" open terminal
nmap <C-t> :tabnew<Space><Bar><Space>terminal<ENTER>i
" Exit without saving
map <C-c> <Esc>:qa!<CR>
" Number the lines
set number
" Palenight theme
set background=dark
  set termguicolors
colorscheme palenight
" Change tab length
set tabstop=2 shiftwidth=2 expandtab
" VScode shorthand for console.log
imap log<Enter> console.log()<Left>
" Press enter to autocomplete
inoremap <silent><expr> <Cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Paste text without the mappings changing the pasted text
imap <C-v> <Esc>:set<Space>paste<Enter>"+p:set<Space>nopaste<Enter>i
" Add signcolumn to editor
autocmd VimEnter * set scl=yes 
" Escape terminal with escape button
tnoremap <Esc> <C-\><C-n>:bd!<CR>
" Fancier status line
let g:airline_powerline_fonts=1
" More dots for the visual indication of the indented lines
let g:indentLine_char = "┊"
" Hide the tildes trailing vim
autocmd VimEnter * hi NonText guifg=bg
set noshowmode
