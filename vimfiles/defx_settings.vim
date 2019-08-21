" defx shit is only declared in the Defx buffer.
" if you open a defx buffer a new script is run
" to describe all mappings that are active only
" in the Defx buffer
" use a localleader here ' (single quote)


" KEYMAPS
" open explorer: <Leader>e

" expand tree of all open files
"
"
"
" Defx required functionality
" - Open defx in a split with the home directory as base directory
" - Open file in the right split <o> or <CR>
" - Expand directory under cursor <o> or <CR>
" - Open in a split to right <LocalLeader>s
" - Open in a vsplit to right <LocalLeader>v
" - Open in a new tab (also open Defx buffer in the new tab with same layout)
"		but do not switch to that file
" - Open a file in the right split
" - replace the window other than defx
"   remap / to search all filenames in the base directory structure
"   remap <LocalLeader>/ to grep in all the files in the directory structure
"   with the .gitignore or .ignore file in consideration

" {{{ vimrc_defx augroup

" RESET
augroup vimrc_defx
	autocmd!
augroup END

" INIT
if v:vim_did_enter
  call s:setup_defx()
else
  augroup vimrc_defx
    autocmd VimEnter * call s:setup_defx()
  augroup END
end

augroup vimrc_defx
  autocmd FileType defx call s:setup_defx_mappings()
augroup END


" }}}

" {{{ defx setup

function! s:setup_defx()
  nnoremap <Leader>df :call <sid>defx_open({ 'split': v:true })<CR>
endfunction

function! s:setup_defx_mappings()
  nnoremap <silent><buffer><expr> 'q
  \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <expr><buffer><silent> o
        \ <SID>defx_toggle_tree()
  nnoremap <expr><buffer><silent> <CR>
        \ <SID>defx_toggle_tree()
  nnoremap <expr><buffer><silent> 's
        \ defx#do_action('open', 'split')
  nnoremap <expr><buffer><silent> 'v
        \ defx#do_action('open', 'vsplit')
  nnoremap <expr><buffer><silent> 't
        \ defx#do_action('open', 'tabnew')
  nnoremap <expr><buffer><silent> 'n
        \ defx#do_action('new_file')
  nnoremap <expr><buffer><silent> u
		\ <SID>defx_change_dir('..')
  nnoremap <expr><buffer><silent> c
		\ <SID>defx_change_dir()
endfunction

" }}}

" {{{ functions

" defx_change_dir(...): takes 1 arg; specify the dir to change defx to
" also changes working dir. argument: { dir: 'relative' or 'absolute' path}

function! s:defx_change_dir(...) 
	if a:0 > 0 && a:1 ==# '..'
		let l:dir_path = a:1
	elseif defx#is_directory()
		let l:dir_path = expand(get(defx#get_candidate(), 'action__path'))
	endif
	if l:dir_path !=# ''
		exe 'cd ' . l:dir_path  
		return defx#do_action('multi', [['cd', l:dir_path], 'change_vim_cwd'])
	endif
endfunction

function! s:defx_open(...)
	"TODO set the current working directory to the opened dir
  let l:opts = get(a:, 1, {})
  let l:path = get(l:opts, 'dir', expand('%:p:h'))

  if !isdirectory(l:path)
    let l:path = getcwd()
  endif

  " if calling from a Defx buffer
  if &filetype ==? 'defx'
    "check if other buffers active in that tab, otherwise open a new file
    if len(tabpagebuflist()) > 1
	  execute("quit")
      return
    else
      execute("wincmd vnew") 
      execute("Defx -toggle")
	  return
    endif
  endif

  " if calling from a regular buffer
  let l:args = "-direction=topleft -winwidth=60"

  if has_key(l:opts, 'split')
    let l:args .= ' -split=vertical' 
  endif

  call execute(printf('Defx -toggle %s %s', l:args, l:path))
  call execute('wincmd p')
  call execute(printf('cd %s', l:path))
endfunction


function! s:defx_toggle_tree() abort
  if defx#is_directory()
    return defx#do_action('open_or_close_tree')
  endif
  return defx#do_action('drop')
endfunction


nnoremap <silent><Leader>n :call <sid>defx_open({ 'split': v:true })<CR>
nnoremap <silent><Leader>hf :call <sid>defx_open({ 'split': v:true, 'find_current_file': v:true })<CR>

" function s:get_project_root() abort
"   let l:git_root = ''
"   let l:path = expand('%:p:h')
"   let l:cmd = systemlist('cd '.l:path.' && git rev-parse --show-toplevel')
"   if !v:shell_error && !empty(l:cmd)
"     let l:git_root = fnamemodify(l:cmd[0], ':p:h')
"   endif
" 
"   if !empty(l:git_root)
"     return l:git_root
"   endif
" 
"   return getcwd()
" endfunction


" }}}
