" Map 'jj' to '\' for when typing latex
inoremap jj \

let mapleader = " "
set showcmd

" Formatting definitions: always use 4 spaces as indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Show (absolute) line numbers, but disable the sign column so it doesn't move my text left and
" right all the time
set number
set signcolumn=no

" Break lines automatically at 100 chars
set linebreak
set textwidth=100

" Enable spell checking by default
set spell

set hidden

" Don't highlight everything after I use search to jump around
set nohlsearch

" ==== COC ====
" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting
nmap <leader>f  <Plug>(coc-format)

" Code actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Move between diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')

" Packages
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'cespare/vim-toml'

call plug#end()

" ======== COLOURS ========

" Use a nice default colour scheme, and force true colour
colo evening
set termguicolors

" Dropdown menu should be dark grey, with a cyan highlight over the selected element
hi Pmenu ctermbg=DarkGrey ctermfg=White guibg=#555555 guifg=#ffffff
hi PmenuSel ctermbg=LightBlue ctermfg=Black cterm=italic guibg=#00ccff guifg=#000000 gui=italic 

" Hints should be light blue, info should be green, warnings yellow and errors red
hi CocHintFloat ctermfg=LightBlue cterm=bold guifg=#00ccff gui=bold
hi CocHintSign ctermfg=LightBlue cterm=italic guifg=#55aacc gui=italic

hi CocInfoFloat ctermfg=LightGreen cterm=bold guifg=#00ff00 gui=bold
hi CocInfoSign ctermfg=LightGreen cterm=italic,bold guifg=#00ff00 gui=italic,bold

hi CocWarningFloat ctermfg=Yellow cterm=bold guifg=#ffff00 gui=bold
hi CocWarningSign ctermfg=Yellow cterm=italic,bold guifg=#ffff00 gui=italic,bold

hi CocErrorFloat ctermfg=Red cterm=bold guifg=#ff0000 gui=bold
hi CocErrorSign ctermfg=Red cterm=italic,bold guifg=#ff0000 gui=italic,bold

" To make the coc-hints easy to spot without using the sign column set the line numbers to be
" darkish steely grey
hi LineNr ctermfg=grey ctermbg=NONE cterm=NONE guifg=#666699 gui=NONE guibg=NONE

" Folded lines are italic, lime on dark grey
hi Folded guifg=#00ff00 guibg=#444444 gui=italic

" Force transparent background
hi Normal ctermbg=None guibg=None
hi NonText ctermfg=None guibg=None
