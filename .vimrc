" ------------ ajh's .vimrc ------------
" Syntax, FileType, Colorscheme, RTP {{{1
syntax on
filetype plugin indent on
colorscheme spacegray
runtime macros/matchit.vim

" Install vim-plug {{{1
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Git wrapper
Plug 'tpope/vim-fugitive'

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Syntax checking hacks for vim
Plug 'vim-syntastic/syntastic'

" task manager & clocker
Plug 'dhruvasagar/vim-dotoo'

" Commenter
Plug 'scrooloose/nerdcommenter'

" Initialize plugin system
call plug#end()

" General {{{1
set autoread
set backspace=indent,eol,start
set clipboard^=unnamed
set complete=.,w,b,t,kspell
set dictionary+=/usr/share/dict/words
set hidden
set mouse=n ttymouse=sgr
set nostartofline
set nojoinspaces
set nofoldenable
set nrformats-=octal
set path=.,**
set switchbuf=useopen,usetab
set tags^=.git/tags
set ttimeoutlen=50
set wildmenu wildcharm=<C-z>

" UI {{{1
set termguicolors
set formatoptions+=1j
set lazyredraw
set linebreak
set list listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:·
set showcmd showbreak=↪
set splitright

" Statusline {{{1
set laststatus=2
set statusline=[%n]\ %f\ [%{&ff}/%{strlen(&fenc)?&fenc:&enc}/%{&ft}]\ %m%r%w%q
set statusline+=%=%<[0x%B]\ [%P\ %l/%L\ at\ %c]

" Searching {{{1
set hlsearch incsearch
set ignorecase smartcase
set showmatch matchtime=2

" Indenting {{{1
set autoindent
set breakindent breakindentopt=shift:4,sbr
set smarttab expandtab
set softtabstop=4 shiftwidth=4 shiftround

" Backup {{{1
set history=200
set noswapfile
set backup backupdir=~/.vim/backup/
set undofile undodir=~/.vim/backup/undo/

" Wildignore {{{1
set wildignore+=tags,.hg,.git,.svn,*.pyc,*.spl,*.o,*.out,*.DS_Store,*.class,*.manifest,*~,#*#,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,*.xc*,*.pbxproj,*.xcodeproj/**,*.xcassets/**

" General Mappings {{{1
let g:mapleader = ' '

" Switch between files
nnoremap <leader>f :find *
nnoremap <leader>F :find <C-r>=expand('%:p:h').'/**/*'<CR>
nnoremap <leader>\ :vertical sfind *
nnoremap <leader><bar> :vertical sfind <C-r>=expand('%:p:h').'/**/*'<CR>
nnoremap <leader>- :sfind *
nnoremap <leader>_ :sfind <C-r>=expand('%:p:h').'/**/*'<CR>

" Switch between splits
nnoremap <silent> <C-h> <C-w><C-h>
nnoremap <silent> <C-j> <C-w><C-j>
nnoremap <silent> <C-k> <C-w><C-k>
nnoremap <silent> <C-l> <C-w><C-l>

" Move by display lines
nnoremap <expr> j  v:count == 0 ? 'gj' : 'j'
nnoremap <expr> k  v:count == 0 ? 'gk' : 'k'
nnoremap <expr> gj v:count == 0 ? 'j' : 'gj'
nnoremap <expr> gk v:count == 0 ? 'k' : 'gk'

" Remap some default keys to be more useful
nnoremap Q gq
nnoremap Y y$
nnoremap S i<CR><ESC>^m`gk:silent! s/\s\+$//<CR>:noh<CR>``
nnoremap + za
nnoremap * *zz
nnoremap # #zz
nnoremap n nzz
nnoremap N Nzz
xnoremap * :<C-u>call visualfuncs#start('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call visualfuncs#start('?')<CR>/<C-R>=@/<CR><CR>
nnoremap zS :<C-u>echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')<CR>

" The only mappings I used from vim-unimpaired
nnoremap ]q :cnext<CR>zz
nnoremap [q :cprevious<CR>zz
nnoremap ]l :lnext<CR>zz
nnoremap [l :lprevious<CR>zz
nnoremap coh :nohlsearch<CR>
nnoremap col :set list! <bar> set list?<CR>
nnoremap cos :set spell! <bar> set spell?<CR>
nnoremap con :set relativenumber! number!<CR>

" Quicker cgn/cgN
nnoremap <leader>* *``cgn
nnoremap <leader># #``cgN

" Visually Select a line without indentation
nnoremap <leader>v ^vg_

" re-indent file while retaining cursor position.
nnoremap <leader>= :call format#reindent()<CR>

" Remove trailing whitespace
nnoremap <leader>w m`:let @s = @/<CR>:silent! %s/\s\+$//<CR>:let @/ = @s<CR>:nohl<CR>``

" cd to the current file's path
nnoremap <leader>c :cd %:p:h<CR>:pwd<CR>

" Buffer switching
nnoremap <expr> <leader>b buffer#switchBySplitting('horizontally')
nnoremap <expr> <leader>B buffer#switchBySplitting('vertically')

" Git
nnoremap <leader>gb :echo system('git rev-parse --abbrev-ref @ <bar> tr -d "\n"')<CR>
nnoremap <leader>go :silent !tig<CR>:silent redraw!<CR>
nnoremap <leader>gB :silent !tig blame % +<C-r>=expand(line('.'))<CR><CR>:silent redraw!<CR>

" Search mappings
nnoremap <leader>s viw:<C-u>grep! <C-R>=visualfuncs#getSelection()<CR><CR>:cwindow<bar>redraw!<CR>
xnoremap <leader>s :<C-u>grep! <C-r>=visualfuncs#getSelection()<CR><CR>:cwindow<bar>redraw!<CR>
nnoremap g/ /\<\><left><left>
nnoremap <leader>j :tjump /
nnoremap <leader>J :ptjump /

" Plugin Settings {{{1
let [html_indent_script1, html_indent_style1] = ['inc', 'inc']
let [hs_highlight_boolean, hs_highlight_types, hs_highlight_more_types] = [1, 1, 1]
let [python_highlight_all, java_highlight_all] = [1, 1]
let [netrw_winsize, netrw_banner, netrw_liststyle] = [20, 0, 3]

" Plugin Maps {{{1
" Autocommands {{{1
augroup VIMRC
  autocmd!
  autocmd BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
  autocmd BufReadPost * silent! execute 'normal! g`"zzzv'
  autocmd BufWritePost * if &diff | diffupdate | endif
  autocmd InsertLeave * if bufname('%') != '[Command Line]' | pclose | endif
augroup END

" Commands {{{1
command! BD silent e# | bd#
command! Scriptnames call setqflist(scripts#get()) | copen
command! Make silent make! | redraw! | cwindow
command! Lmake silent lmake! | redraw! | lwindow
command! -nargs=1 Grep vimgrep /<args>/ ** | copen

