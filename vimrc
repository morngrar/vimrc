"syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set rnu
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey




"
" Plugins:
"

" run the following command to install plugin manager:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" TODO: add autoinstallation of vim-plug

call plug#begin('~/.vim/plugged')

"Plug 'morhetz/gruvbox'
Plug 'lifepillar/gruvbox8'
"Plug 'jremmen/vim-ripgrep' " currently has an annoying bug on start
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'

" Note: that for this you need to navigate to subfolder and run install script
Plug 'ycm-core/YouCompleteMe'

"Plug 'mbbill/undotree'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" js and react
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'alvan/vim-closetag'

" auto-pairing characters
Plug 'Raimondi/delimitMate'

"Plug 'dkarter/bullets.vim' "messes with bulletlists

" rwxrob's markdown stuff
"Plug 'vim-pandoc/vim-pandoc'       " these overwrites my zettel file jumping
"Plug 'rwxrob/vim-pandoc-syntax-simple'

call plug#end()

"
" END plugins
"

" vim-closetag config:
let g:closetag_filenames = '*.html,*.xhtml,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.tsx'
let g:closetag_filetypes = 'html,js'
let g:closetag_xhtml_filetype = 'xhtml,jsx,tsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
  \ 'typescript.tsx': 'jsxRegion,tsxRegion',
  \ 'javascript.jsx': 'jsxRegion',
  \ }
let g:closetag_shortcut = '>'



" Bullets.vim
"let g:bullets_enabled_file_types = [
"    \ 'markdown',
"    \ 'text',
"    \ 'gitcommit',
"    \ 'scratch'
"    \]

colorscheme gruvbox8
set background=dark
"set termguicolors
" fix issue with spell checker highlights
"let g:gruvbox_guisp_fallback = "bg"

"let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" ignoreing node_modules and other crap from ctrlp
set wildignore+=*/node_modules/*,*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" ctrlp uses the silver searcher (ag), and apparently it doesn't need caching
let g:ctrlp_use_caching = 0

" auto-close preview on accepting a completion
let g:ycm_autoclose_preview_window_after_completion = 1


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>wh :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>wj :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>wk :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>wl :wincmd l<CR>
nnoremap <leader>wv :vsp % :wincmd l<CR>
nnoremap <leader>ws :split % :wincmd j<CR>
nnoremap <leader>wq :close<CR>
nnoremap <leader>n :noh<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <silent> <Leader>d+ :resize +5<CR>
nnoremap <silent> <Leader>d- :resize -5<CR>
nnoremap <F2> :set tw=0 nowrap nolinebreak cc=0<cr>
nnoremap <F3> :set tw=79 wrap linebreak cc=80<cr>
nnoremap <F4> :set spell<cr>
nnoremap <F5> :set nospell<cr>

" xclip command for copying visual selection
vnoremap <leader>y :!vimclip<cr>


" YouCompleteMe bindings -- what do these do?
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>gf :YcmCompleter FixIt<CR>


" Remap ø and æ to [ ] for spelling stuff
nnoremap øs [s
nnoremap øS [S
nnoremap æs ]s
nnoremap æS ]S

" general fugitive remaps
nnoremap <leader>gg :Git<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gl :Git log<cr>
nnoremap <leader>gL :Git log --graph<cr>


" Easier pasting (snagged from https://github.com/tpope/vim-unimpaired)
function! s:setup_paste() abort
  let s:paste = &paste
  set paste
endfunction

nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I
nnoremap <silent> ygi :call <SID>setup_paste()<CR>gi
nnoremap <silent> ygI :call <SID>setup_paste()<CR>gI

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END



" Unknown remaps

" ripgrep? --- doesn't work atm
"nnoremap <leader>ps :Rg<SPACE>
"

"
" filetype specific configs (autocmd)
"

" go
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>L  <Plug>(go-lint)
autocmd FileType go nmap <leader>c  <Plug>(go-coverage-toggle)
autocmd FileType go set noexpandtab
autocmd FileType go set autowrite
" commenting and uncommenting
autocmd FileType go vmap <leader>, :norm i//<cr>
autocmd FileType go vmap <leader>. :s/\/\///<cr> :noh<cr>

" snippets
autocmd FileType go imap ifr<Tab> <Esc>:.!snip go if-err-not-nil<CR>jA<Tab>

" python
autocmd FileType python nmap <leader>r :w<cr> :!python %<cr>
" type check current file with mypy
autocmd FileType python nmap <leader>c :!mypy %<cr>
" commenting and uncommenting
autocmd FileType python vmap <leader>, :norm i#<cr>
autocmd FileType python vmap <leader>. :s/#//<cr> :noh<cr>

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1



" commenting and uncommenting in .js and .jsx files
autocmd FileType javascript vmap <leader>, :norm i//<cr>
autocmd FileType javascript vmap <leader>. :s/\/\///<cr> :noh<cr>
autocmd FileType javascriptreact vmap <leader>, :norm i//<cr>
autocmd FileType javascriptreact vmap <leader>. :s/\/\///<cr> :noh<cr>
autocmd FileType jsx vmap <leader>, :norm i//<cr>
autocmd FileType jsx vmap <leader>. :s/\/\///<cr> :noh<cr>



" markdown
autocmd FileType markdown set wrap
autocmd FileType markdown set linebreak
autocmd FileType markdown set cc=0
autocmd FileType markdown nmap <leader>b :w<cr>:!pandoc -V geometry:a4paper -o out.pdf %<cr>:!xdg-open out.pdf<cr>
autocmd FileType markdown vnoremap <leader>ze :!zetextract %<cr>:w<cr>
autocmd FileType markdown vnoremap <leader>l :!proselint %<cr>
autocmd FileType markdown nnoremap gf :w<cr>:e $HOME/zettel/<cfile>.md<cr>
autocmd FileType markdown nnoremap gl /[[<cr>w:noh<cr>
autocmd FileType markdown nnoremap <leader>zb !!zetbranch %<cr>:w<cr>j/[[<cr>w:noh<cr>:e $HOME/zettel/<cfile>.md<cr>4jA
autocmd FileType markdown nnoremap <leader>zc :!cat %<cr>
autocmd FileType markdown nnoremap <leader>zt o- [ ] 
autocmd FileType markdown nnoremap <silent><leader>zl :!zetlink %<cr><cr>
" open zettel under cursor in new window
autocmd FileType markdown nnoremap <leader>zo :w<cr>:!zetopen -p <cfile><cr><cr>
" open current zettel in new window
autocmd FileType markdown nnoremap <leader>zO :w<cr>:!zetopen -f -p %<cr><cr>


" latex
autocmd FileType tex set wrap
autocmd FileType tex set tw=79
autocmd FileType tex set linebreak
autocmd FileType tex nmap <leader>b :w<cr>:!make<cr> :!make view<cr>
autocmd FileType tex nmap <leader>m :w<cr>:!make<cr>
autocmd FileType tex nmap <leader>c :w<cr>:!make clean<cr>
" commenting and uncommenting
autocmd FileType tex vmap <leader>, :norm i%<cr>
autocmd FileType tex vmap <leader>. :s/%//<cr> :noh<cr>


" bash
autocmd FileType bash nmap <leader>r :w<cr> :!./%<cr>
autocmd FileType bash nnoremap <leader>c :w<cr> :!shellcheck %<cr>

