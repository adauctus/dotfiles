call plug#begin('~/.vim/plugged')
" nginx
Plug 'chr4/nginx.vim'
" .editorconfig
Plug 'editorconfig/editorconfig-vim'
" .fish
Plug 'dag/vim-fish', { 'for': 'fish' }
" Asynchronous Lint Engine
Plug 'dense-analysis/ale'
" Git
Plug 'tpope/vim-fugitive'
" Ansible
Plug 'pearofducks/ansible-vim', { 'do': 'UltiSnips/generate.py', 'for': 'yaml' }
" Rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" defaults - todo: replace
Plug 'tpope/vim-sensible'
" Auto-Completion
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py --clang-completer --cs-completer --rust-completer --ts-completer' }
" NERDTree
Plug 'scrooloose/nerdtree'
call plug#end()

" Settings
let g:is_posix = 1
set fixendofline

" Commands
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"
com! FormatJSON :%!python3 -m json.tool
com! TrimTrailingWhitespace :%s/\s\+$//e

" keyboard mappings (be sparing with these!)
map <C-n> :NERDTreeToggle<CR>

" autocmds (be even more sparing with these!)
" quit NERDTree if it's the last remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
