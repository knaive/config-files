"判断系统是linux还是windows
if(has("win32") || has("win95") || has("win64") || has("win16"))
  let g:iswindows=1
else
  let g:iswindows=0
endif

"函数定义
map <F5> :call Do_OneFileMake()<CR>
"用makefile编译
map <F7> :call Do_make()<CR>
map <C-F7> :silent make clean<CR>

function Do_OneFileMake()
  if expand("%:p:h")!=getcwd()
    echohl WarningMsg | echo "Fail to make! This file is not in the current dir! Press <F7> to redirect to the dir of this file." | echohl None
    return
  endif
  let sourcefileename=expand("%:t")
  if (sourcefileename=="" || (&filetype!="cpp" && &filetype!="c"))
    echohl WarningMsg | echo "Fail to make! Please select the right file!" | echohl None
    return
  endif
  let deletedspacefilename=substitute(sourcefileename,' ','','g')
  if strlen(deletedspacefilename)!=strlen(sourcefileename)
    echohl WarningMsg | echo "Fail to make! Please delete the spaces in the filename!" | echohl None
    return
  endif
  if &filetype=="c"
    if g:iswindows==1
      set makeprg=gcc\ -o\ %<.exe\ %
    else
      set makeprg=gcc\ -o\ %<\ %
    endif
  elseif &filetype=="cpp"
    if g:iswindows==1
      set makeprg=g++\ -o\ %<.exe\ %
    else
      set makeprg=g++\ -o\ %<\ %
    endif
    "elseif &filetype=="cs"
    "set makeprg=csc\ \/nologo\ \/out:%<.exe\ %
  endif
  if(g:iswindows==1)
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','.exe','g')
    let toexename=outfilename
  else
    let outfilename=substitute(sourcefileename,'\(\.[^.]*\)$','','g')
    let toexename=outfilename
  endif

  if filereadable(outfilename)
    if(g:iswindows==1)
      let outdeletedsuccess=delete(getcwd()."\\".outfilename)
    else
      let outdeletedsuccess=delete("./".outfilename)
    endif
    if(outdeletedsuccess!=0)
      set makeprg=make
      echohl WarningMsg | echo "Fail to make! I cannot delete the ".outfilename | echohl None
      return
    endif
  endif
  execute "silent make"
  set makeprg=make

  execute "normal :"
  if filereadable(outfilename)
    if(g:iswindows==1)
      execute "!".toexename
    else
      execute "!./".toexename
    endif
  endif
  execute "copen"

endfunction

function Do_make()
  set makeprg=make
  execute "silent make"
  execute "copen"
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""END""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

