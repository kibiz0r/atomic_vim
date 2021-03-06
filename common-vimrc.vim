" Load all plugins in bundles
filetype off
call pathogen#runtime_append_all_bundles() 

if v:version < '703' || !has('python')"{{{
  let g:gundo_disable=1
endif"}}}

if v:version >= '703'"{{{
  call pathogen#runtime_append_all_bundles("bundle73") 
endif"}}}

filetype plugin indent on

" Matchit is now built into recent Vims (7.2+)
" Use the native one instead of the old plugin.
runtime macros/matchit.vim

:set guifont=Monaco:h12
:set guioptions-=T
let mapleader=","

set autoindent
set bs=2
set clipboard=unnamed
set completeopt=longest,menuone
set expandtab
set grepformat=%f:%l:%m
set grepprg=ack
set hidden
set ignorecase
set incsearch
set mouse=a
set nocompatible
set nohlsearch
set nowrap
set number
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smartcase
set smartindent
set smarttab
set wildmenu
set wildmode=longest,list,full

colorscheme vividchalk
syntax on
compiler ruby

" Fix typos
cabbr W w
cabbr Q q
map <F1> <Esc>
imap <F1> <Esc>

" close the current buffer, doesn't close the window
 noremap <leader>w :Bclose<cr>
" close the current buffer, ignoring save state, doesn't close the window
 noremap <leader>W :Bclose!<cr>
" close the current window and buffer
 noremap <leader>q :bd<cr>
" close the current window, doesn't close the buffer
 noremap <leader>Q :close<cr>

" Find in cwd/"project"
noremap <leader>f :AckWithIgnore ''<Left>
noremap <leader>F :AckWithIgnore -i ''<Left>

" Run the current file. Uses .vim/ruby/run_file.rb
noremap <leader>r :RunFile<cr>
noremap <leader>R :RunFileAtLine<cr>

" Textmate CMD-t emulation
let g:fuf_enumeratingLimit = 25
map <leader>t :FufTaggedFile<CR>
map <leader>T :FufTag<CR>
map <leader><C-t> :RegenTags<CR>:FufRenewCache<CR>
map <leader>l :FufLine<CR>

" bring up buffer list. ,,<CR> switches to last used buffer
map <leader>, :FufBuffer<CR>

" like browse to a file with a convenient ,t-like interface
map <leader>e :FufFile<CR>

" render undo tree - vim 7.3 and up
map <leader>u :GundoToggle<CR>

" comment out a line
map <leader>/ :TComment<Return>

" used to set the clipboard buffer to system clipboard. example use: ,cp to
" paste from clipboard
map <leader>c "*

" Redraw screen
map <leader>d :redraw!<CR>

" Window split vertical
noremap <leader>v :vsplit<CR><C-W><C-W>

" Remove all window splits
noremap <leader>o :only<CR>

" autocmd FileType ruby,eruby set omnifunc=rubycomplete ai sw=2 sts=2 et
if has("autocmd")
  filetype indent on
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

" global variables that can be overridden or appended to in .vim in the cwd to
" customize stuff

" folders that should be ignored
let g:vim_ignore = ["log", "vendor", "build"]

" extensions that should be included in tag files
let g:taggable_extensions = [
                              \ 'as',
                              \ 'c',
                              \ 'coffee',
                              \ 'cs',
                              \ 'css',
                              \ 'emblem',
                              \ 'erb',
                              \ 'feature',
                              \ 'java',
                              \ 'js',
                              \ 'haml',
                              \ 'html',
                              \ 'md',
                              \ 'php',
                              \ 'rake',
                              \ 'rb',
                              \ 'sass',
                              \ 'scss',
                              \ 'sql',
                              \ 'thor',
                              \ 'xml',
                              \ 'yaml',
                              \ 'yml',
                              \ 'clj',
                              \ 'pde',
                              \ 'cpp',
                              \ 'h',
                              \ ]

" load .vim in the current directory if it exists
if filereadable(".vim")
  source .vim
endif

if exists('g:vim_ignore')
  if !exists('g:fuzzy_ignore')
    let g:fuzzy_ignore=join(map(copy(g:vim_ignore), 'v:val . "/**"'), ",")
  endif

  if !exists('g:ack_ignore')
    let g:ack_ignore=copy(g:vim_ignore)
  endif
endif

" clojure configuration
let clj_highlight_builtins = 1
let clj_paren_rainbow = 1

" actionscript tab settings
autocmd FileType actionscript
  \ setlocal shiftwidth=4 |
  \ setlocal tabstop=4 |
  \ setlocal noexpandtab

