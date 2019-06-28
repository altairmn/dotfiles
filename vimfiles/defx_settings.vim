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
"   <LocalLeader>t
"   remap / to search all filenames in the base directory structure
"   remap <LocalLeader>/ to grep in all the files in the directory structure
"   with the .gitignore or .ignore file in consideration

augroup vimrc_defx
	autocmd!
augroup END

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

function! s:setup_defx_mappings()
  let maplocalleader="'" 
"  nnoremap <expr><buffer><silent> o
"        \ defx#do_action('open_or_close_tree')
"  nnoremap <expr><buffer><silent> <CR>
"        \ defx#do_action('open_or_close_tree')
  nnoremap <expr><buffer><silent> 's
        \ defx#do_action('open', 'split')
  nnoremap <expr><buffer><silent> 'v
        \ defx#do_action('open', 'vsplit')
  nnoremap <expr><buffer><silent> 't
        \ defx#do_action('open', 'tabnew')
endfunction

function! s:setup_defx()
  nnoremap <Leader>df :Defx -split=vertical -direction=topleft -winwidth=40 -toggle<CR>
endfunction
