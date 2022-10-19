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
set tabstop=4
set shiftwidth=4
set softtabstop=4
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
" Plug 'voldikss/vim-translator'
Plug 'scrooloose/nerdcommenter'
Plug 'cohama/agit.vim'
Plug 'tpope/vim-fugitive'
" Plug 'pseewald/vim-anyfold'
Plug 'airblade/vim-gitgutter'
Plug 'wincent/ferret'
Plug 'rhysd/vim-clang-format'
" Plug 'Yggdroot/LeaderF'
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
" Plug 'skywind3000/asyncrun.vim'
Plug 'ycm-core/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

call plug#end()  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 快捷键配置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <F2> :PreviousBuffer<cr>
nmap <silent> <F3> :NextBuffer<cr>
nmap <silent> <F4> :CloseBuffer<cr>
nmap <silent> <F5> :YcmDiags<cr>
nmap <silent> <F6> :BufOnly<cr>
nmap <silent> <F9> :NERDTreeToggle<cr>
nmap <silent> <F10> :TagbarToggle<cr>
nmap <silent> <F11> :NextColorScheme<cr>
nmap <silent> <S-F11> :PreviousColorScheme<cr>
nmap <silent> <F12> :ShowColorScheme<cr>

nmap <silent> <leader><leader>i :PlugInstall<cr>
nmap <silent> <leader><leader>u :PlugUpdate<cr>
nmap <silent> <leader><leader>c :PlugClean<cr>

nmap <silent> <leader><leader>t :TranslateW<cr>
vmap <silent> <leader><leader>t :TranslateWV<cr>
nmap <silent> <leader><leader>g :Agit<cr>

nmap <silent> <leader>c :edit ~/.vim/.ycm_extra_conf.py<cr>
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
nmap <silent> en :set number!<cr>
nmap <silent> ep :set paste!<cr>

nmap <silent> gw <Plug>(YCMFindSymbolInWorkspace)
nmap <silent> gf <Plug>(YCMFindSymbolInDocument)

nmap <silent> ga :Switch<cr>
nmap <silent> go :YcmCompleter GoToInclude<cr>
nmap <silent> gd :YcmCompleter GoToDefinition<CR>
nmap <silent> gD :YcmCompleter GoToDeclaration<CR>
nmap <silent> gi :GoToFunImpl<cr>
nmap <silent> gr :YcmCompleter GoToReferences<CR>

nmap <silent> sg :split<cr>
nmap <silent> sv :vsplit<cr>

nmap <silent> /  <Plug>(incsearch-forward)
nmap <silent> ?  <Plug>(incsearch-backward)
nmap <silent> g/ <Plug>(incsearch-stay)

let s:ycm_hover_popup = -1
function s:Hover()
  let response = youcompleteme#GetCommandResponse( 'GetDoc' )
  if response == ''
    return
  endif

  call popup_hide( s:ycm_hover_popup )
  let s:ycm_hover_popup = popup_atcursor( balloon_split( response ), {} )
endfunction

" CursorHold triggers in normal mode after a delay
autocmd CursorHold * call s:Hover()
" Or, if you prefer, a mapping:
nmap <silent> <c-d> :call <SID>Hover()<CR>

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

let g:translator_history_enable = 'true'

" anyfold
let g:anyfold_fold_comments=1

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

" asyncrun
let g:asyncrun_open = 1

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_concepts_highlight = 1
let g:cpp_no_function_highlight = 1

" ycm
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_extra_conf_globlist = ['~/*', '~/QQMail/*', '~/code/*', '~/bigdata/*']

let g:ycm_enable_diagnostic_signs = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_error_symbol = '!!'
let g:ycm_warning_symbol = '!'
let g:ycm_add_preview_to_completeopt = 0

let g:ycm_use_clangd = 1
let g:ycm_clangd_binary_path = '/usr/local/bin/clangd'
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_key_list_select_completion = ['<Enter>', '<TAB>', '<Down>']
let g:ycm_goto_buffer_command = 'same-buffer'
let g:ycm_disable_for_files_larger_than_kb = 10000


