" Author: Slevin Zhang <slevinz@outlook.com>

" ===========================================================================
" VIM-PLUG {{{
" ===========================================================================
" (minimalist plugin manager)

call plug#begin()

" *PRIMARY PLUGINS*
Plug 'lfilho/cosco.vim'             " smart comma, semicolon
Plug 'ctrlpvim/ctrlp.vim'           " fuzzy file/buffer search
Plug 'Raimondi/delimitMate'         " closing brackets, quotes, etc.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'             " fzf vim integration
Plug 'scrooloose/nerdtree'
Plug 'kshenoy/vim-signature'        " view marks
Plug 'neomake/neomake'              " neomake: syntax checker and linter
"Plug 'ervandew/supertab'            " tab auto completion
Plug 'tpope/vim-commentary'         " easier commenting
Plug 'junegunn/vim-easy-align'      " text alignment plugin
Plug 'tommcdo/vim-exchange'         " easy text exchange for vim
Plug 'jeetsukumaran/vim-filebeagle' " vinegar inspired file manager
Plug 'terryma/vim-multiple-cursors' " multiple cursor
Plug 'tpope/vim-repeat'             " . repeat for plugins
Plug 'justinmk/vim-sneak'           " slim easy motion
Plug 'tpope/vim-surround'           " surroundings manipulation
Plug 'tpope/vim-unimpaired'         " many helpful mappings
if has('python') || has('python3')  " snippets
  Plug 'FelikZ/ctrlp-py-matcher'      " Faster ctrl p matcher with Python
  Plug 'editorconfig/editorconfig-vim' " editor config for code consistency
  Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
endif
Plug 'vim-scripts/DrawIt'           " Draw it


" *SYNTAX PLUGINS*
Plug 'jelera/vim-javascript-syntax' " Enhanced JS
Plug 'tomlion/vim-solidity' " For solidity
"
" *AESTHETIC PLUGINS*
Plug 'itchyny/lightline.vim'        " better looking UI
Plug 'kristijanhusak/vim-hybrid-material' " material theme
Plug 'mhartington/oceanic-next'     " material theme;
Plug 'jdsimcoe/abstract.vim'
Plug 'gcmt/taboo.vim'               " rename tabs
Plug 'jdkanani/vim-material-theme'    " another material theme
Plug 'ajmwagar/vim-deus'


call plug#end()

" }}}
" ===========================================================================
"  GENERAL SETTINGS {{{
" ===========================================================================

if has('autocmd')
  "filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif
 
set nobackup
set nowritebackup
set noswapfile
set autowrite     " Automatically :write before running commands
set synmaxcol=400    " don't highlight past 400 characters
set ignorecase       " search isn't case sensitive
set incsearch        " incremental search
set ruler
set lazyredraw       " redraw the screen less often
set splitbelow  " Open new split panes to right and bottom,
set splitright  "  which feels more natural
set diffopt+=vertical " Always use vertical diffs
 
 
" }}}
" ===========================================================================
"  APPEARANCE/AESTHETIC {{{
" ===========================================================================
 
set t_Co=256
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 
" set background=dark
" colorscheme hybrid_material
" colorscheme hybrid_reverse
" colorscheme OceanicNext
" colorscheme abstract
colorscheme deus
let g:deus_termcolors=256

hi Normal guibg=NONE ctermbg=NONE
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
set guicursor=
 
" highlight cursor line on active window
augroup CursorLine
au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END
 
" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=81
 
" set numbers
set number
 
" }}}
" ===========================================================================
" TEXT AND FORMATTING {{{
" ===========================================================================
 
" Softtabs, 2 spaces
set tabstop=4
set shiftwidth=4
set softtabstop=4
" set shiftround
set noexpandtab
 
" indent/format settings for different file types
augroup filetype_specific
  au!
  au FileType vim  :setlocal ts=2 sts=0 sw=2 et fdm=marker fdl=0
  au BufRead,BufNewFile *.h,*.c set filetype=c
  au Filetype c  :setlocal ts=8 sts=8 sw=8 noexpandtab
augroup END
 
" last knwon cursor, auto markdown
augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe 'normal! g`"zvzz' |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " autocmd BufWinLeave *.* mkview
  " autocmd BufWinEnter *.* silent loadview
augroup END
 

" MARKDOWN SPECIFIC SHIT
 
function! MathAndLiquid()
    "" Define certain regions
    " Block math. Look for "$$[anything]$$"
    syn region math start=/\$\$/ end=/\$\$/
    " inline math. Look for "$[not $][anything]$"
    syn match math_block '\$[^$].\{-}\$'

    " Liquid single line. Look for "{%[anything]%}"
    syn match liquid '{%.*%}'
    " Liquid multiline. Look for "{%[anything]%}[anything]{%[anything]%}"
    syn region highlight_block start='{% highlight .*%}' end='{%.*%}'
    " Fenced code blocks, used in GitHub Flavored Markdown (GFM)
    syn region highlight_block start='```' end='```'

    "" Actually highlight those regions.
    hi link math Statement
    hi link liquid Statement
    hi link highlight_block Function
    hi link math_block Function
endfunction

" Call everytime we open a Markdown file
autocmd BufRead,BufNewFile,BufEnter *.md,*.markdown call MathAndLiquid()
" ENDS HERE
 
 
" }}}
" ===========================================================================
" KEY MAPPINGS + ALIASES {{{
" ===========================================================================
" anything related to plugins is located
" under its respective PLUGIN SETTINGS section
 
" ---------------------------------------------------------------------------
" REMAPS OF DEFAULTS {{{
" ---------------------------------------------------------------------------

" Y yanks until EOL, more like D and C
nnoremap Y y$
" U as a more sensible redo
nnoremap U <C-r>
" use ctrl j for Join line
noremap <C-j> J
" [S]plit line (sister to [J]oin lines)
nnoremap <C-s> i<CR><Esc>^mwgk:silent! s/\v +$//<CR>:noh<CR>
" big J / K travel 10 lines, K originally 'man' lookup
noremap J 10j
noremap K 10k
" Ctrl h / l for easy beginning / end of line, TODO <BS> fix in future
noremap <C-h> ^
noremap <C-l> $
" move by wrapped lines instead of line numbers
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" - quick go to the end with Enter
nnoremap <CR> G$
" Left right flipping pages, remap less used keys
nnoremap <Left> <C-b>
nnoremap <Right> <C-f>
nnoremap <Up> <C-u>
nnoremap <Down> <C-d>
" { and } skip over closed folds
nnoremap <expr> } foldclosed(search('^$', 'Wn')) == -1 ? "}" : "}j}"
nnoremap <expr> { foldclosed(search('^$', 'Wnb')) == -1 ? "{" : "{k{"

" }}}
" ---------------------------------------------------------------------------
" NORMAL MAPS {{{
" ---------------------------------------------------------------------------

" switch window
nnoremap <Tab> <C-w>W

" insert current datetime
nnoremap <F5> "=strftime("%c")<CR>P<ESC>
inoremap <F5> <C-R>=strftime("%c")<CR>

" }}}
" ---------------------------------------------------------------------------
" LEADER MAPS {{{
" ---------------------------------------------------------------------------

let mapleader = " "     " space leader
" 
" " Switch between the last two files
" nnoremap <Leader><Tab> <c-^>
" 
" " clear search highlight
 nnoremap <Leader>l :nohl<CR>
 
 " write file / all files
 nnoremap <Leader>w :w<CR>
 nnoremap <Leader>W :wa<CR>
 " quick all windows
 nnoremap <Leader>q :q<CR>
 nnoremap <Leader>Q :qa<CR>
 " quick without save
 nnoremap <Leader>1 :q!<CR>
 nnoremap <Leader>! :qa!<CR>
 " save & quick all windows
 nnoremap <Leader>x :x<CR>
 nnoremap <Leader>X :xa<CR>
 
 " copy paste from system clipboard
 noremap <Leader>y "+y
 noremap <Leader>p "+p
 noremap <Leader>P "+P
 
 " quickly open and edit nvimrc
noremap <Leader>vn :vsp ~/.config/nvim/init.vim<CR>
noremap <Leader>so :so ~/.config/nvim/init.vim<CR>
 
 " tab
 nnoremap <Leader>tc :tabclose<CR>
 nnoremap <Leader>tn :tabnew<CR>
 nnoremap <Leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
 
 nnoremap <Leader>tm :tabm
 
 nnoremap <Leader>; :tabm-1<CR>
 nnoremap <Leader>' :tabm+1<CR>
 
 
 " quickly open URL
 function! HandleURL()
   let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
   echo s:uri
   if s:uri != ""
     silent exec "!firefox '".s:uri."'"
   else
     echo "No URI found in line."
   endif
 endfunction
 noremap <leader>u :call HandleURL()<cr>
 
 " }}}
 " ---------------------------------------------------------------------------
 " COMMAND ALIASES {{{
 " ---------------------------------------------------------------------------
 
 " Clear Trailing White spaces
 cabbrev ctw s/\s\+$//e
 
 " delete all buffers
 cabbrev bdall 0,999bd!
 
 " }}}
 " ---------------------------------------------------------------------------
 
 " }}}
 " ===========================================================================
 " PLUGIN SETTINGS {{{
 " ===========================================================================
 
 
 " cosco.vim {{{
 " ctrl z for smart semi colons
 autocmd FileType javascript,css nnoremap <silent> <C-k> :call cosco#commaOrSemiColon()<CR>
 autocmd FileType javascript,css inoremap <silent> <C-k> <c-o>:call cosco#commaOrSemiColon()<CR>
 " }}}
 
 " CtrlP {{{
 " ignore .git folders to speed up searches
 let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
 let g:ctrlp_max_depth = 15
 let g:ctrlp_max_files = 30000
 " include hidden files
 let g:ctrlp_show_hidden = 1
 " change default CtrlP mapping
 let g:ctrlp_map = '<Leader>]'
 " Use python matcher
 let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch'  }
 " specific directory search
 nnoremap <silent> <Leader>[ :CtrlPCurWD<CR>
 " access recent files and buffers
 nnoremap <silent> <Leader>e :CtrlPMRUFiles<CR>
 nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
 " }}}
 
 " delimitMate {{{
 " auto new line space expansion
 let delimitMate_expand_space = 1
 let delimitMate_expand_cr = 1
 " semicolon end 
 inoremap <C-l> <C-o>A;<Esc>
 " }}}
 
 " fzf.vim {{{
 let g:fzf_layout = { 'down': '30%' }
 nnoremap <silent><Leader>fz :FZF<CR>
 nnoremap <Leader>F :Files ~/
 nnoremap <silent><Leader>fb :Buffers<CR>
 
 let g:fzf_nvim_statusline = 0 " disable statusline overwriting
 
 nnoremap <silent> <leader>a :Buffers<CR>
 nnoremap <silent> <leader>A :Windows<CR>
 " nnoremap <silent> <leader>; :BLines<CR>
 nnoremap <silent> <leader>o :BTags<CR>
 nnoremap <silent> <leader>O :Tags<CR>
 nnoremap <silent> <leader>? :History<CR>
 nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
 nnoremap <silent> <leader>. :AgIn 
 
 nnoremap <silent> K :call SearchWordWithAg()<CR>
 vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
 nnoremap <silent> <leader>gl :Commits<CR>
 nnoremap <silent> <leader>ga :BCommits<CR>
 nnoremap <silent> <leader>ft :Filetypes<CR>
 
 imap <C-x><C-f> <plug>(fzf-complete-file-ag)
 imap <C-x><C-l> <plug>(fzf-complete-line)
 
 function! SearchWordWithAg()
   execute 'Ag' expand('<cword>')
 endfunction
 
 function! SearchVisualSelectionWithAg() range
   let old_reg = getreg('"')
   let old_regtype = getregtype('"')
   let old_clipboard = &clipboard
   set clipboard&
   normal! ""gvy
   let selection = getreg('"')
   call setreg('"', old_reg, old_regtype)
   let &clipboard = old_clipboard
   execute 'Ag' selection
 endfunction
 
 function! SearchWithAgInDirectory(...)
   call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
 endfunction
 
 command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
 
 " }}}
 
 " lightline {{{
 let g:lightline = { 'colorscheme': 'wombat' }
 " }}}
 
 " NERDTree {{{
 " NERDTree Toggle shortcut
 nnoremap <Leader>N :NERDTreeToggle<CR><C-w>=
 " Auto delete buffer
 let NERDTreeAutoDeleteBuffer = 1
 " Auto CWD
 let NERDTreeChDirMode = 1
 " Show hidden file by default
 let NERDTreeShowHidden = 1
 " map key help from ? to ÷
 let NERDTreeMapHelp = '?'
 " so that I can use default J/K within NT
 let NERDTreeMapJumpLastChild = 'gj'
 let NERDTreeMapJumpFirstChild = 'gk'
 " so that I can use vim-sneak within NT
 let NERDTreeMapOpenVSplit = '<C-v>'
 " }}}
 
 " Syntastic {{{
 let g:syntastic_javascript_checkers = ['jshint']
 " opens errors in the location list
 nnoremap <Leader>rr :Errors<CR>
 " reset Syntastic (clears errors)
 nnoremap <Leader>rs :SyntasticReset<CR>
 " }}}
 
 " vim-easy-align {{{
 " Start interactive EasyAlign in visual mode (e.g. vipga)
 xmap ga <Plug>(EasyAlign)
 " Start interactive EasyAlign for a motion/text object (e.g. gaip)
 nmap ga <Plug>(EasyAlign)
 " }}}
 
 " vim-sneak {{{
 let g:sneak#streak = 1 " Emulate easyMotion
 let g:sneak#use_ic_scs = 1 " case insensitive search
 " }}}
 
 " neomake {{{
 " call neomake#configure#automake('nw', 750)
 " }}}
 
" Temporary CSCOPE TEMP!!!
nnoremap <Leader>cs :so ~/cscope/cscope_maps.vim<CR>
 " }}}
