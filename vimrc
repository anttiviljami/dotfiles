""
" anttiviljami's vimrc
"
" twitter: @anttiviljami
" https://github.com/anttiviljami
""

" defaults for vim-template
" https://github.com/aperezdc/vim-template
let g:username = "Antti Kuosmanen"
let g:email = "antti@seravo.fi"
let g:license = "GPLv3"

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Pathogen
"execute pathogen#infect()

filetype plugin indent on

" force startup to default locale
language C

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup		" keep a backup file
set backupdir=~/.vimbackup,~/tmp,~/ " set backup directory

set history=1000	" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" E is explore !
cnoreabbrev E Explore

" Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  colorscheme vc
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" No trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

" Display options
set number		" Add line numbers.
set encoding=utf-8 	" Default Character encoding is UTF-8
set nowrap 		" No line wrapping

" For the times you forget sudo
cmap w!! w !sudo tee > /dev/null %


" easy paste mode toggle
set pastetoggle=<F2>

" Proper tab size
set tabstop=2 shiftwidth=2 expandtab " Tabs are 2 spaces!

" PHPDoc
nnoremap <C-y> :call PhpDocSingle()<CR>

" OS X Crontabs are silly
if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif
