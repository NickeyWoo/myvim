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
set virtualedit=block,onemore

set autoindent
set cindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set nowrap
set backspace=2
set sidescroll=10
" set nofoldenable

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

Plug 'Yggdroot/indentLine'
Plug 'voldikss/vim-translator'
Plug 'scrooloose/nerdcommenter'
Plug 'cohama/agit.vim'
Plug 'rhysd/vim-clang-format'
Plug 'Yggdroot/LeaderF'
Plug 'preservim/tagbar'
Plug 'mileszs/ack.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chxuan/vim-buffer'
Plug 'haya14busa/incsearch.vim'
Plug 'chxuan/change-colorscheme'
Plug 'skywind3000/asyncrun.vim'
Plug 'ycm-core/YouCompleteMe'

call plug#end()  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <F2> :PreviousBuffer<cr>
nmap <F3> :NextBuffer<cr>
nmap <F4> :CloseBuffer<cr>
nmap <F6> :BufOnly<cr>
nmap <F8> :YcmDiags<cr>
nmap <F9> :NERDTreeToggle<cr>
nmap <F10> :TagbarToggle<cr>
nmap <F11> :NextColorScheme<cr>
nmap <S-F11> :PreviousColorScheme<cr>
nmap <F12> :ShowColorScheme<cr>

nmap <leader><leader>i :PlugInstall<cr>
nmap <leader><leader>u :PlugUpdate<cr>
nmap <leader><leader>c :PlugClean<cr>

nmap <leader>e :edit $MYVIMRC<cr>
nmap <leader>s :source $MYVIMRC<cr>
nmap <leader>d :CloseBuffer<cr>

nmap <leader>n :NERDTreeToggle<cr>
nmap <leader>g :Agit<cr>
nmap <leader>t :TranslateW<cr>
vmap <leader>t :TranslateWV<cr>

nmap <leader>o :YcmCompleter GoToInclude<cr>

nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <tab> <c-w><c-w>

nmap ew <c-w><c-w>
nmap enn :set nonu<cr>
nmap en :set nu<cr>
nmap ep :set paste<cr>
nmap enp :set nopaste<cr>
nmap ef :LeaderfFile .<cr>
nmap eF :Ack!<space>

nmap cf :ClangFormat<cr>

nmap sg :split<cr>
nmap sv :vsplit<cr>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 插件配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

let g:translator_history_enable = 'true'

" 注释
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" let g:clang_format#auto_format_on_insert_leave=1
let g:clang_format#code_style="google"

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

" asyncrun
let g:asyncrun_open = 1

" ycm
let g:ycm_min_num_of_chars_for_completion = 1

let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'
" let g:ycm_python_sys_path = [
        " \   '~/QQMail/',
        " \   '~/code/',
        " \   '~/code/leveldb',
        " \   '~/code/rocksdb',
        " \   '~/bigdata/',
        " \   '~/bigdata/ClickHouse',
        " \   '~/project/',
        " \   '~/QQMail/mm3rd/',
        " \   '~/QQMail/mm3rd/rapidjson/include/',
        " \   '~/QQMail/mm3rd/boost/',
        " \   '~/QQMail/mm3rd/curl/include/',
        " \   '~/QQMail/mm3rd/hadoop/libhdfs/',
        " \   '~/QQMail/mm3rd/jsoncpp/include/',
        " \   '~/QQMail/mm3rd/jsoncpp/include/json/',
        " \   '~/QQMail/mm3rd/l5client/',
        " \   '~/QQMail/mm3rd/mysql/',
        " \   '~/QQMail/mm3rd/protobuf/include/',
        " \   '/usr/include/',
        " \   '/usr/local/include'
"         \ ]
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_select_completion = ['<Enter>', '<TAB>', '<Down>']
" let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_goto_buffer_command = 'split-or-existing-window'
let g:ycm_disable_for_files_larger_than_kb = 10000


