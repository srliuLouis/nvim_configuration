"----------------------------------------------------------------
" 1. Plugins
"----------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'dpelle/vim-LanguageTool'
Plug 'kamykn/popup-menu.nvim'
Plug 'kamykn/spelunker.vim'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'pangloss/vim-javascript'
Plug 'matze/vim-move'
call plug#end()

" Airline plugin setting
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1

" NERDTree plugin setting
autocmd StdinReadPre * let s:std_in=1
let g:indentLine_char = '.'

" YouCompleteMe setting (Work-around)
let g:go_version_warning = 0
let g:loaded_youcompleteme = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_use_clangd = 1

" Vim-snippets(coc-snippets) setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsExpandTrigger = "<C-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir = '~/.config/nvim/plugged/vim-snippets/snippets'
let g:UltiSnipsSnippetDirectories = ['UltiSnips', "~/.config/nvim/plugged/vim-snippets/UltiSnips"]
set rtp+=~/.config/nvim/plugged/vim-snippets

" LanguageTool settings
let g:languagetool_jar='~/LanguageTool/LanguageTool*/languagetool-commandline.jar'

" Spelunker settings
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim_on_readonly = 1

" DoxygenToolkit settings
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Shirong Liu"

" vim-javascript setting
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

" matze-move setting
let g:move_key_modifier = 'C'

"----------------------------------------------------------------
" 2. General settings
"----------------------------------------------------------------
syntax enable
set encoding=utf-8
set backspace=indent,eol,start
set scrolloff=1
set nocompatible
set number
set ruler
set showmode
set hlsearch
set cursorline
set wrap
set statusline+=%F
set laststatus=2
set ls=2 " shows a status line 
set hidden
set cmdheight=2
set updatetime=300

" Tab and Space configuration
set smarttab
set tabstop=4
set expandtab
set shiftwidth=4
set list
set listchars=tab:>-,trail:.
set shiftround
set incsearch
set smartcase

" Indent
set autoindent
set cindent " this turns on C style indentation

" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/vim_backup,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/vim_backup,/var/tmp,/tmp

"----------------------------------------------------------------
" 3. Hot Key
"----------------------------------------------------------------
filetype on
" Auto comment and umcomment with F5 and F6 key
autocmd FileType c,cpp let b:comment_leader = '// '
autocmd FileType sh,python   let b:comment_leader = '# '
autocmd FileType vim   let b:comment_leader = '" '
noremap <silent> #5 :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> #6 :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

noremap <f8> :wq<CR>

" Clang-Format
noremap <C-K> :pyf /usr/local/Cellar/clang-format/10.0.1/share/clang/clang-format.py<CR>
noremap <C-K> <c-o>:pyf /usr/local/Cellar/clang-format/10.0.1/share/clang/clang-format.py<CR>
