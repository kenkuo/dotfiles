" auto install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug directory
call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

"needed to fix startify?
set viminfo='100,n$HOME/.vim/files/info/viminfo

syntax enable
colorscheme monokai
" colorscheme solarized
" set background=dark
" set t_Co=256


set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab autoindent
set nu
