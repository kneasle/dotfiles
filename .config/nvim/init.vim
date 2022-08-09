" ========== GENERAL CONFIG ==========

set showcmd

" Formatting definitions: always use 4 spaces as indentation
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Show (absolute) line numbers, but disable the sign column so it doesn't move my text left and
" right all the time
set number
set signcolumn=yes

" Break lines automatically at 100 chars
set linebreak
set textwidth=100

" Enable spell checking by default
set spell

set hidden
set nocompatible

" Don't highlight everything after I use search to jump around
set nohlsearch

" ==== KEYS ====

let mapleader = " "
" Map 'jl' to '\' for when typing latex
inoremap jl \



" ======== COLOURS ========

" Use a nice default colour scheme, and force true colour
syntax enable
colo evening
set termguicolors

" Dropdown menu should be dark grey, with a cyan highlight over the selected element
hi Pmenu ctermbg=DarkGrey ctermfg=White guibg=#555555 guifg=#ffffff
hi PmenuSel ctermbg=LightBlue ctermfg=Black cterm=italic guibg=#00ccff guifg=#000000 gui=italic 

" To make the coc-hints easy to spot without using the sign column set the line numbers to be
" darkish steely grey
hi LineNr ctermfg=grey ctermbg=NONE cterm=NONE guifg=#666699 gui=NONE guibg=NONE

" Folded lines are italic, lime on dark grey
hi Folded guifg=#00ff00 guibg=#444444 gui=italic

" Transparent background
hi Normal ctermbg=None guibg=None
hi NonText ctermfg=None guibg=None
hi SignColumn ctermfg=None guibg=None



" ========== PLUGINS ==========

let g:plug_url_format = "https://github.com/%s.git"

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP support
Plug 'AndrewRadev/sideways.vim'                 " swapping list elements
Plug 'sheerun/vim-polyglot'                     " good syntax highlighting
Plug 'wellle/context.vim'                       " show context above buffer
Plug 'norcalli/nvim-colorizer.lua'              " highlight hex values with that colour
Plug 'machakann/vim-highlightedyank'            " highlight yanked text
Plug 'tpope/vim-commentary'                     " comment/uncomment with `gc`
Plug 'easymotion/vim-easymotion'                " very very fast movement
Plug 'airblade/vim-gitgutter'                   " git diffs in sign column
Plug 'jiangmiao/auto-pairs'                     " VSCode-style automatic bracketing

Plug 'junegunn/vim-easy-align'                  " easily align things
" Plug 'liuchengxu/vim-which-key'                 " :WhichKey to see available keys
" Plug 'itchyny/lightlime.vim'                    " :WhichKey to see available keys
" Plug 'SirVer/ultisnips'                         " snippet completion

call plug#end()

filetype plugin indent on
" setup `nvim-colourizer` (**after** setting `termguicolors`)
lua require 'colorizer'.setup()



" ========== PLUGIN CONFIG ==========

" sideways
nnoremap <silent> <c-h> :SidewaysLeft<cr>
nnoremap <silent> <c-l> :SidewaysRight<cr>
nnoremap <silent> <c-k> :SidewaysJumpLeft<cr>
nnoremap <silent> <c-j> :SidewaysJumpRight<cr>

" alignment
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" easy motion
nmap <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>l <Plug>(easymotion-overwin-line)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" highlighted yank
let g:highlightedyank_highlight_duration = -1   " persist yank highlight until I type
hi HighlightedyankRegion ctermbg=DarkGrey guibg=#444444

" git-gutter
set updatetime=100
let g:gitgutter_sign_modified = '| '
let g:gitgutter_sign_added = '| '
let g:gitgutter_sign_modified_removed = '|_'
hi GitGutterAdd          ctermfg=Green  ctermbg=None guifg=#009900 guibg=None gui=bold
hi GitGutterChange       ctermfg=Yellow ctermbg=None guifg=#ffff00 guibg=None gui=bold
hi GitGutterChangeDelete ctermfg=Yellow ctermbg=None guifg=#ff7700 guibg=None gui=bold
hi GitGutterDelete       ctermfg=Red    ctermbg=None guifg=#ff0000 guibg=None gui=bold

" ==== CoC ====

" Don't warn me that neovim isn't up-to-date.  I'm stuck with the Ubuntu's version until I can
" switch back to Arch Linux
let g:coc_disable_startup_warning = 1

" Hints should be light blue, info should be green, warnings yellow and errors red
hi CocHintFloat ctermfg=LightBlue cterm=bold guifg=#00ccff gui=bold
hi CocHintSign ctermfg=LightBlue cterm=italic guifg=#55aacc gui=italic

hi CocInfoFloat ctermfg=LightGreen cterm=bold guifg=#00ff00 gui=bold
hi CocInfoSign ctermfg=LightGreen cterm=italic,bold guifg=#00ff00 gui=italic,bold

hi CocWarningFloat ctermfg=Yellow cterm=bold guifg=#ffff00 gui=bold
hi CocWarningSign ctermfg=Yellow cterm=italic,bold guifg=#ffff00 gui=italic,bold

hi CocErrorFloat ctermfg=Red cterm=bold guifg=#ff0000 gui=bold
hi CocErrorSign ctermfg=Red cterm=italic,bold guifg=#ff0000 gui=italic,bold

" Goto
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Renaming
nmap <leader>rn <Plug>(coc-rename)

" Code actions
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Completion menu
inoremap <silent><expr> <c-f> coc#_select_confirm()

" Move between diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

command! -nargs=0 Format :call CocAction('format')
