set nocompatible

" If we have a .dotfiles directory, use that instead of the directory under
" $HOME
let s:dotfiles_vim = $HOME."/.dotfiles/vim"
if isdirectory(s:dotfiles_vim)
    let s:home_vim_patt = ",\\?".$HOME."/\\.vim[^,]*,\\?"
    let &runtimepath=s:dotfiles_vim.",".substitute(&runtimepath, s:home_vim_patt, "", "g").",".s:dotfiles_vim."/after"
endif

filetype off
call pathogen#runtime_append_all_bundles()

filetype plugin indent on

" Fix ultisnips
set foldopen+=insert,jump

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set hidden
set history=50
set ruler
set showcmd
set incsearch
set ignorecase
set smartcase
set visualbell
set cursorline
set ttyfast
set wildmenu
set laststatus=2
set relativenumber

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch highlighting on
syntax on
set hlsearch

" General autocmds
augroup vimrcEx
    au!
    " When editing a file, always jump to the last known cursor position.
    autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

augroup END

augroup PDF
    au!
    autocmd BufReadPre *.pdf silent call system('zathura ' . shellescape(expand('%')) . '&')
    autocmd BufReadPost *.pdf silent :bdelete
augroup END

augroup encrypted
    au!
    autocmd BufReadPre,FileReadPre *.gpg,*.enc setlocal viminfo= | setlocal noswapfile | setlocal nobackup | setlocal nowritebackup " Don't record information
    autocmd BufReadPre,FileReadPre *.gpg,*.enc setlocal binary 
    autocmd BufReadPost,FileReadPost *.gpg,*.enc %!gpg -q --no-tty --output - -d
    autocmd BufReadPost,FileReadPost *.gpg,*.enc setlocal nobin
    autocmd BufWritePre,FileWritePre *.gpg,*.enc setlocal bin|%!gpg -e 2> /dev/null
    autocmd BufWritePost,FileWritePost *.gpg,*.enc u|setlocal nobin
augroup END

augroup MSWord
    au!
    autocmd BufReadPost,FileReadPost *.doc :%!antiword '%'
augroup END

" List of filetypes to load autocorrect file for
let g:autocorrect_filetypes = ['*.tex', 'mail', 'text']
for item in g:autocorrect_filetypes
    execute "autocmd BufReadPost,FileReadPost,BufNewFile" item "source ~/.vim/spell/autocorrect.vim"
endfor

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Map personal keybindings
let mapleader = ","

nnoremap <Leader><space> :noh<CR>

nnoremap <Tab> %
vnoremap <Tab> %

nnoremap <silent> <Leader>s <C-w>s
nnoremap <silent> <Leader>v <C-w>v<C-w>l
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap <silent> <Leader>c <C-w>c

inoremap <C-E> <End>
inoremap <C-A> <Home>
inoremap <C-Space> <Esc>
inoremap <C-S> <C-r><tab>

inoremap jj <ESC>
nnoremap <silent> ; :
vnoremap ; :

nnoremap <silent> <C-D> :lcd %:p:h<CR>
nnoremap <silent> <C-C> :!ctags -R *<CR><CR>

nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap j gj
vnoremap k gk
nnoremap <silent> $ g$
vnoremap $ g$
nnoremap <silent> 0 g0
vnoremap 0 g0

nnoremap / /\v
vnoremap / /\v

noremap  :TlistToggle<CR>

nnoremap <silent> <C-N> :NERDTreeToggle<CR>

nnoremap <Leader>fe :FufFile<CR>
nnoremap <Leader>fb :FufBuffer<CR>
nnoremap <Leader>ft :FufBufferTag<CR>
nnoremap <Leader>fh :FufHelp<CR>
nmap <Leader>e <Leader>fe
nmap <Leader>b <Leader>fb
nmap <Leader>t <Leader>ft

" Fixing latex
let g:tex_flavor='latex'

" Tlist variables
" Autorun tagger
let generate_tags=1
" Window variables
let Tlist_Use_Right_Window = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 0
let Tlist_File_Fold_Auto_Close = 1

" vimwiki options
let g:vimwiki_list = [{'path': '~/notes/', 'ext': '.note'}]
let g:vimwiki_folding = 1
let g:vimwiki_browsers = ['gelinks']

" Supertab options
let g:SuperTabDefaultCompletionType = "context"

" Set the colorscheme
if (exists("&t_Co") && &t_Co >= 256)
"    let moria_monochrome = 1
"    set background=dark
"    colorscheme moria
    colorscheme skittles_dark
else
    colorscheme desert
endif

" If program has a gui
if v:progname =~? "gvim"
	:gui
    set lines=200 columns=200
    set guioptions=acg
    set guifont=Monospace\ 8
	colorscheme mustang
endif
