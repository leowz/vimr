set nocompatible
filetype off

" 代码折叠
set foldenable
set foldmethod=marker
set foldlevel=99

"set font
set guifont=Menlo\ Regular:h22

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number
set numberwidth=5

" 高亮80列
set colorcolumn=80
hi ColorColumn guibg=#2d2d2d ctermbg=246

" 高亮显示当前行/列
highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
set cursorline
set cursorcolumn

" 高亮显示搜索结果
set hlsearch

" 开启语法高亮功能
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" vim 自身命令行模式智能补全
set wildmenu
set wildmode=list:longest,full

"show command
set showcmd

"Toggle relative numbering, and set to absolute on loss of focus or insert
mode
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

" - SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F3> "F2 before pasting to preserve indentation
    "Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
    
"plungin Vundle setting
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'christoomey/vim-run-interactive'
Plugin 'croaky/vim-colors-github'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-scripts/ctags.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Lokaltog/vim-powerline'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'tomasr/molokai'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'Yggdroot/indentLine'
Plugin 'majutsushi/tagbar'
Plugin 'takac/vim-hardtime'
call vundle#end()
filetype plugin indent on

" 配色方案
"set background=dark
let g:solarized_termcolors=256
"colorscheme solarized
colorscheme molokai
"colorscheme phd i

" 将制表符扩展为空格
set expandtab
" " 设置编辑时制表符占用空格数
set tabstop=4
" " 设置格式化时制表符占用空格数
set shiftwidth=4
" " 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

"indntLine
let g:indentLine_loaded = 1
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'
let g:indentLine_conceallevel = 2

"NERDTree
let NERDTreeWinPos='right'
let NERDTreeWinSize=20
map <F2> :NERDTreeToggle<CR>
"

"TabBar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_width=25   
let g:tagbar_autofocus = 1

 "hard time setting
 let g:hardtime_timeout = 3000
 let g:hardtime_default_on = 1
 let g:hardtime_maxcount = 2
