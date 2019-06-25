call NERDTreeAddKeyMap({
  \ 'key': 'gx',
  \ 'callback': 'NERDTreeExternalOpen',
  \ 'quickhelpText': 'open file node in external program',
  \ 'scope': 'FileNode' })

let s:MSEXCEL = '"C:\Program Files (x86)\Microsoft Office\root\Office16\EXCEL.EXE"'

function! NERDTreeExternalOpen(filenode)
  if a:filenode.path.str() =~# 'csv$'
    let s:cmd = s:MSEXCEL . ' ' . a:filenode.path.str()
    execute "silent " . "!" . s:cmd
    call system('cmd.exe', s:cmd)
  endif
endfunction
