inoremap <C-B> <C-X><C-O>

let mapleader = " "
set showcmd

" Formatting definitions: always use 4 spaces as indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Show (absolute) line numbers
set number
" Always show the sign column so that when I'm using LSP clients, it doesn't
" keep appearing and dissapearing
set signcolumn=yes

set hidden

" Don't hightlight everything after I use search to jump around
set nohlsearch

" Use a nice default colour scheme, and force true colour
colo evening
set termguicolors

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

command! -nargs=0 Format :call CocAction('format')

" Packages
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Tweaks to the colour scheme to make Coc work better

" Dropdown menu should be dark grey, with a cyan highlight over the selected
" element
hi Pmenu ctermbg=DarkGrey ctermfg=White guibg=#555555 guifg=#ffffff
hi PmenuSel ctermbg=LightBlue ctermfg=Black cterm=italic guibg=#00ccff guifg=#000000 gui=italic 

hi CocHintFloat ctermfg=LightBlue cterm=bold guifg=#00ccff gui=bold
hi CocHintSign ctermfg=LightBlue cterm=italic guifg=#55aacc gui=italic

hi CocInfoFloat ctermfg=LightGreen cterm=bold guifg=#00ff00 gui=bold
hi CocInfoSign ctermfg=LightGreen cterm=italic,bold guifg=#00ff00 gui=italic,bold

hi CocWarningFloat ctermfg=Yellow cterm=bold guifg=#ffff00 gui=bold
hi CocWarningSign ctermfg=Yellow cterm=italic,bold guifg=#ffff00 gui=italic,bold

hi CocErrorFloat ctermfg=Red cterm=bold guifg=#ff0000 gui=bold
hi CocErrorSign ctermfg=Red cterm=italic,bold guifg=#ff0000 gui=italic,bold

" Force transparent background
hi Normal ctermbg=None guibg=None
hi NonText ctermfg=None guibg=None
