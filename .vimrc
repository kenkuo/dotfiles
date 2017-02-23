" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

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
Plug 'chriskempson/base16-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux'
Plug 'crusoexia/vim-monokai'
Plug 'edkolev/tmuxline.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-sensible'
call plug#end()

"YCM auto compile

"startify
set viminfo='100,n$HOME/.vim/files/info/viminfo
let g:startify_custom_indices= ['q','w','e','r','a','s','d','f','j','k','l',';']

"vim-airline settings
set laststatus=2
let g:airline_theme='solarized'

syntax enable
set background=dark
colorscheme solarized
set t_Co=256


set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set nu
