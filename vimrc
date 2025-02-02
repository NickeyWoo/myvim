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
" Plug 'gergap/vim-ollama'

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
" nmap <silent> <leader>n :NERDTreeToggle<cr>
nmap <silent> <leader>t :TagbarToggle<cr>

nmap <silent> <leader>d :CloseBuffer<cr>
nmap <silent> <leader>p :PreviousBuffer<cr>
nmap <silent> <leader>b :NextBuffer<cr>

nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
" nmap <tab> <c-w><c-w>

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

let g:clang_format#auto_filetypes = [ 'c', 'cpp' ]
let g:clang_format#code_style = "google"
let g:clang_format#detect_style_file = 1
let g:clang_format#auto_format = 1
let g:clang_format#style_options = {
            \ "DerivePointerAlignment" : "false",
            \ "PointerAlignment" : "Left",
            \ "SortIncludes" : "false",
            \ "SortUsingDeclarations" : "false",
            \ "IncludeBlocks" : "Preserve",
            \ "SpacesBeforeTrailingComments" : 2,
            \ "ForEachMacros" : [''],
            \ "IndentPPDirectives" : "AfterHash"}
autocmd FileType c,cpp,cc,hh,h,hpp ClangFormatAutoEnable
autocmd FileType proto ClangFormatAutoDisable

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

" vim-ollama
let g:ollama_host = 'http://localhost:11434'

" Default chat model
let g:ollama_chat_model = 'llama3.2'

" Codellama models
let g:ollama_model = 'codellama:13b-code'
let g:ollama_model = 'codellama:7b-code'
let g:ollama_model = 'codellama:code'

" Codegemma (small and fast)
let g:ollama_model = 'codegemma:2b'
let g:ollama_fim_prefix = '<|fim_prefix|>'
let g:ollama_fim_middle = '<|fim_middle|>'
let g:ollama_fim_suffix = '<|fim_suffix|>'

" qwen2.5-coder (0.5b, 1.5b, 3b, 7b, 14b, 32b)
" smaller is faster, bigger is better"
" https://ollama.com/library/qwen2.5-coder
let g:ollama_model = 'qwen2.5-coder:3b'
let g:ollama_fim_prefix = '<|fim_prefix|>'
let g:ollama_fim_middle = '<|fim_middle|>'
let g:ollama_fim_suffix = '<|fim_suffix|>'

" Deepseek-coder-v2
let g:ollama_model = 'deepseek-coder-v2:16b-lite-base-q4_0'
let g:ollama_fim_prefix = '<｜fim▁begin｜>'
let g:ollama_fim_suffix = '<｜fim▁hole｜>'
let g:ollama_fim_middle = '<｜fim▁end｜>'

nmap <silent> <leader>ai :OllamaChat<cr>

" coc
set updatetime=300
set shortmess+=c
set signcolumn=yes

let g:coc_global_extensions = [
      \ 'coc-marketplace',
      \ '@yaegassy/coc-volar',
      \ 'coc-tsserver',
      \ 'coc-json', 'coc-diagnostic',
      \ 'coc-html', 'coc-css',
      \ 'coc-clangd', 'coc-yaml',
      \ 'coc-go', 'coc-jedi',
      \ 'coc-sumneko-lua', 'coc-explorer',
      \ 'coc-vimlsp', 'coc-cmake',
      \ 'coc-sh', 'coc-db',
      \ 'coc-pyright',
      \ 'coc-toml', 'coc-solidity',
      \ 'coc-prettier',
      \ 'coc-sql', 'coc-protobuf',
      \ 'coc-snippets', 'coc-pairs', 'coc-word',
      \ 'coc-translator',
      \ 'coc-git',
      \ ]

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-@> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>ff  <Plug>(coc-format-selected)
nmap <leader>ff  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

nmap <silent> <leader>n :CocCommand explorer<cr>
nnoremap <silent><nowait> <space>g  :CocCommand clangd.switchSourceHeader<cr>

" tagbar
" 设置 ctags 的 Go 语言支持
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

