syntax on

let mapleader = " "

let tabsize = 4
execute "set tabstop=".tabsize
execute "set softtabstop=".tabsize
execute "set shiftwidth=".tabsize

set expandtab
set smarttab
set smartindent
set autoindent

set nu
set noerrorbells
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
nnoremap <F8> :setl noai nocin nosi noh inde=<CR>

" -----------------------------------------------------------------------------------------------------------------------------------------
" leader config

nnoremap <leader>gt :LsByTab<CR>
nnoremap <leader>td :tabc<CR>
nnoremap <silent> <Leader>bd :Bclose<CR>

" db
nnoremap <leader>r :%DB mysql://root@localhost<CR>

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
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod'
Plug 'rbong/vim-flog'
Plug 'lervag/vimtex'
" Plug 'neoclide/coc.nvim', {'branch':'release'}
Plug 'preservim/nerdtree'

Plug 'rbgrouleff/bclose.vim'
Plug 'Yggdroot/indentLine'
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

" remember and reload folds when I leave or enter a buffer
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END


" -----------------------------------------------------------------------------------------------------------------------------------------
" distraction free mode config

nnoremap mz :VimroomToggle<CR>:so C:\Users\Alex\AppData\Local\nvim\init.vim<CR>

let g:vimroom_width=120
let g:vimroom_sidebar_height=0
let g:vimroom_background=9

" fix end of page color and autocomplete menu
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
highlight Pmenu ctermbg=bg ctermfg=bg


" ----------------------------------------------------------------------------- 
" get buffers in current tab


"
" Get the output of :ls as a List of lines.
"
function! s:LsOutput(bang, args)
    redir => ls_output
    exe 'silent ls' . a:bang a:args
    redir END
    return split(ls_output, "\n")
endfunction

"
" Group the output of :ls by tabs and print it.
"
function! LsByTab(bang, args)
    let ls_output = s:LsOutput(a:bang, a:args)

    " Iterate over all tabs.
    for tab in gettabinfo()
        echo '===== tab' tab.tabnr '====='
        " Get the buffer numbers for the current tab.
        let buffers = tabpagebuflist(tab.tabnr)
        " Construct a regular expression that matches the buffer numbers
        " at the start of the lines of the :ls output.
        let buffers_pat = '^\s*\(' . join(buffers, '\|') . '\)\>'
        " Filter the lines from the :ls output so that only the lines for
        " the buffers of the current tab remain.
        let tab_buffers = filter(copy(ls_output), 'v:val =~ buffers_pat')
        " Print the info for the current tab.
        echo join(tab_buffers, "\n")
    endfor
endfunction

command! -bang -nargs=? LsByTab call LsByTab(<q-bang>, <q-args>)



" ---------------------------------------------------------------------------------
" remove mappings


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

" ---------------------------------------------------------
" Disable ctrl-z

cnoremap <C-z> <Nop>
inoremap <C-z> <Nop>
nnoremap <C-z> <Nop>
vnoremap <C-z> <Nop>

" ---------------------------------------------------------
" Show leading whitespace

set list
set listchars=tab:>-

" ---------------------------------------------------------
" Fix ShaDA
" see https://vi.stackexchange.com/a/10029
if !has('nvim')
  set viminfo+=n~/vim/viminfo
else
  " Do nothing here to use the neovim default
  " or do soemething like:
  " set viminfo+=n~/.shada
endif
