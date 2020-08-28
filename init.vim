syntax on

set noerrorbells
set tabstop=2
set softtabstop=2
set shiftwidth=2
" set expandtab
" set smartindent
set autoindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set incsearch
set hlsearch
set ignorecase

set cc=
set rnu

set showcmd
set encoding=utf-8
set splitright
set noshowmode
set laststatus=2

let g:netrw_browse_split=4

" filetype indent off

cd C:\Users\Alex\Projects
ab vimrcpath C:\Users\Alex\AppData\Local\nvim\init.vim

tnoremap <Esc> <C-\><C-n>
nnoremap gb :buffers<CR>:buffer<Space>
nnoremap gB :buffers<CR>:
nnoremap <C-t> :tabnew<Space>
inoremap <C-t> <Esc>:tabnew<Space>
nnoremap <F8> :setl noai nocin nosi inde=<CR>

" -----------------------------------------------------------------------------------------------------------------------------------------
" leader config
nnoremap <leader>p "0p<CR>
" -----------------------------------------------------------------------------------------------------------------------------------------
" plugin config

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'

Plug 'mikewest/vimroom'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'OrangeT/vim-csharp'
Plug 'christoomey/vim-system-copy'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdtree'
call plug#end()

let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_contrast_light = 'hard'
colorscheme gruvbox
set background=dark

map <C-n> :NERDTreeToggle<CR>
nnoremap <F11> :FVimToggleFullScreen<CR>

" fixes copy and paste for vim-system-copy
let g:system_copy#copy_command='clip'
let g:system_copy#paste_command='powershell.exe -NoLogo -NoProfile -Noninteractive -Command "Get-Clipboard"'

" fix syntax highlighting for obscure file types
augroup twig_ft
  au!
  autocmd BufNewFile,BufRead *.razor   set syntax=cshtml
augroup END
" -----------------------------------------------------------------------------------------------------------------------------------------
" coc config

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


" -----------------------------------------------------------------------------------------------------------------------------------------
" distraction free mode config

nnoremap mz :VimroomToggle<CR>:so C:\Users\Alex\AppData\Local\nvim\init.vim<CR>

let g:vimroom_width=120
let g:vimroom_sidebar_height=0
let g:vimroom_background=9

" fix end of page color and autocomplete menu
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
highlight Pmenu ctermbg=bg ctermfg=bg


" Remove newbie crutches in Command Mode
cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

cnoremap <S-Down> <Nop>
cnoremap <S-Left> <Nop>
cnoremap <S-Right> <Nop>
cnoremap <S-Up> <Nop>

" Remove newbie crutches in Insert Mode
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

inoremap <S-Down> <Nop>
inoremap <S-Left> <Nop>
inoremap <S-Right> <Nop>
inoremap <S-Up> <Nop>

" Remove newbie crutches in Normal Mode
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

nnoremap <S-Down> <Nop>
nnoremap <S-Left> <Nop>
nnoremap <S-Right> <Nop>
nnoremap <S-Up> <Nop>

" Remove newbie crutches in Visual Mode
vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

vnoremap <S-Down> <Nop>
vnoremap <S-Left> <Nop>
vnoremap <S-Right> <Nop>
vnoremap <S-Up> <Nop>
