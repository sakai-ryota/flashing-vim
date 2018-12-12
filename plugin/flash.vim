scriptencoding utf-8

if exists("g:loaded_flash_scr")
    finish
endif
let g:loaded_flash_scr = 1

let s:save_cpo = &cpo
set cpo&vim


set t_vb=[?5h$<100>[?5l

nnoremap <silent> sh :call flash#StopFlash()<CR>
command! -nargs=* BTimer call flash#Bomb(<f-args>)


let &cpo = s:save_cpo
unlet s:save_cpo
