" make sure this stays at the top --->
set nocompatible
" <----
" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"YCM auto compile
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction


" vim-plug directory
call plug#begin('~/.vim/plugged')
"themes
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
" Plug 'sickill/vim-monokai'
Plug 'crusoexia/vim-monokai'
"auto-complete
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
"statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"start screen
Plug 'mhinz/vim-startify'
"directory browser
Plug 'scrooloose/nerdtree'
"vim-tmux integration
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
"tmux.conf syntax highlighting
Plug 'tmux-plugins/vim-tmux'
"tmux statusline generator
Plug 'edkolev/tmuxline.vim'
"vim tweaks
Plug 'tpope/vim-sensible'
"adds vim commands :SudoWrite
Plug 'tpope/vim-eunuch'
"git marks
Plug 'airblade/vim-gitgutter'
call plug#end()


"startify
set viminfo='100,n$HOME/.vim/files/info/viminfo
let g:startify_custom_indices= ['1','2','3','4','5','6','7','8','9']

"vim-airline settings
set laststatus=2
let g:airline_theme='monokai'
let g:airline_powerline_fonts=1
let g:airline_section_x = ''        " Get rid of the file encoding
let g:airline_section_y = ''        " Get rid of the file type
" Truncate the status mode to one capital letter
let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '^V' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '^S' : 'S',
\ }

syntax enable
set background=dark
colorscheme monokai
let g:monokai_term_italic = 1
let g:monokai_gui_italic = 1
set t_Co=256

set updatetime=250 ttyfast
set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set nu relativenumber undofile showcmd hidden visualbell wildmenu wildmode=list:longest
set ignorecase smartcase gdefault incsearch showmatch hlsearch
set cursorline wrap


nnoremap ; :
