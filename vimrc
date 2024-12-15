"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nickeywoo's vim configure
" author: nickeywoo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","

filetype on
filetype plugin on
filetype indent on

syntax enable
syntax on

set nocompatible
set noeb
set t_Co=256
set cmdheight=2
set showcmd
set ruler
set laststatus=2
set number
set cursorline
set showmode
set showmatch
set linebreak
set hidden

set timeoutlen=1000
set autoindent
set cindent
set smartindent
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
" set nowrap
set backspace=2
set sidescroll=10
set nofoldenable
" set foldmethod=indent
" set foldlevel=2

set wildmenu 
set completeopt-=preview

set hlsearch
set incsearch
set ignorecase

set nobackup
set nowritebackup
set noswapfile
set autowrite
set confirm

set undolevels=20000
set undofile
set undodir=$HOME/.vim/undo

set langmenu=zh_CN,UTF-8
set helplang=cn
set termencoding=utf-8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

set background=dark
colorscheme badwolf

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin configure
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'NickeyWoo/cpp-mode'
Plug 'easymotion/vim-easymotion'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Yggdroot/indentLine'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdcommenter'
Plug 'cohama/agit.vim'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/ferret'
Plug 'rhysd/vim-clang-format'
Plug 'preservim/tagbar'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chxuan/vim-buffer'
Plug 'haya14busa/incsearch.vim'
Plug 'chxuan/change-colorscheme'
Plug 'neoclide/coc.nvim'

call plug#end()  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F2> :PreviousBuffer<cr>
nmap <silent> <F3> :NextBuffer<cr>
nmap <silent> <F4> :CloseBuffer<cr>
nmap <silent> <F6> :BufOnly<cr>
nmap <silent> <F9> :NERDTreeToggle<cr>
nmap <silent> <F10> :TagbarToggle<cr>
nmap <silent> <F11> :NextColorScheme<cr>
nmap <silent> <S-F11> :PreviousColorScheme<cr>
nmap <silent> <F12> :ShowColorScheme<cr>

nmap <silent> tp :PreviousBuffer<cr>
nmap <silent> tn :NextBuffer<cr>
nmap <silent> cc :CloseBuffer<cr>
nmap <silent> tt :TagbarToggle<cr>

nmap <silent> <leader><leader>i :PlugInstall<cr>
nmap <silent> <leader><leader>u :PlugUpdate<cr>
nmap <silent> <leader><leader>c :PlugClean<cr>

nmap <silent> <leader><leader>g :Agit<cr>

nmap <silent> <leader>e :edit $MYVIMRC<cr>
nmap <silent> <leader>s :source $MYVIMRC<cr>

nmap <silent> <leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader>F :Ack<space>
nmap <silent> <leader>f :Files<cr>
nmap <silent> <leader>l :IndentLinesToggle<cr>
nmap <silent> <leader>n :NERDTreeToggle<cr>
nmap <silent> <leader>t :TagbarToggle<cr>

nmap <silent> <leader>d :CloseBuffer<cr>
nmap <silent> <leader>p :PreviousBuffer<cr>
nmap <silent> <leader>b :NextBuffer<cr>

nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <tab> <c-w><c-w>

nmap <silent> cf :ClangFormat<cr>

nmap <silent> ew <c-w><c-w>
nmap <silent> en :set number!<cr>:IndentLinesToggle<cr>
nmap <silent> ep :set paste!<cr>

nmap <silent> sg :split<cr>
nmap <silent> sv :vsplit<cr>

nmap <silent> /  <Plug>(incsearch-forward)
nmap <silent> ?  <Plug>(incsearch-backward)
nmap <silent> g/ <Plug>(incsearch-stay)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" indentline
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indentLine_char = '┊'
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']


" 注释
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

let g:clang_format#code_style="google"
let g:clang_format#style_options = {
  \ "Language" : "Cpp",
  \ "ColumnLimit" : 120,
  \ "DerivePointerAlignment" : "true",
  \ "PointerAlignment" : "Left",
  \ "SortIncludes" : "false",
  \ "SortUsingDeclarations" : "false",
  \ "IncludeBlocks" : "Preserve",
  \ "IndentPPDirectives" : "AfterHash",
  \ "ForEachMacros" : [''],
  \ "SpacesBeforeTrailingComments" : 2
\ }
autocmd FileType c,cpp,cc,hh,h,hpp ClangFormatAutoEnable

" airline
let g:airline_theme="badwolf"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" nerdtree
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeWinSize = 38

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Mirror the NERDTree before showing it. This makes it the same on all tabs.
nnoremap <C-n> :NERDTreeMirror<CR>:NERDTreeFocus<CR>

" nerdtree-git-plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
        \ "Modified" : "✹",
        \ "Staged" : "✚",
        \ "Untracked" : "✭",
        \ "Renamed" : "➜",
        \ "Unmerged" : "═",
        \ "Deleted" : "✖",
        \ "Dirty" : "✗",
        \ "Clean" : "✔︎",
        \ 'Ignored' : '☒',
        \ "Unknown" : "?"
    \ }

" LeaderF
let g:Lf_WildIgnore = {
        \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
        \}
let g:Lf_UseCache = 0

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1


