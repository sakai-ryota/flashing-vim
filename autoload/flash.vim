scriptencoding utf-8

if !exists("g:loaded_flash_scr")
    finish
endif
let g:loaded_flash_scr = 1

let s:save_cpo = &cpo
set cpo&vim


func! FlashScreen(flashing_tim)
    normal \<ESC>
endfunc

func! StartFlash(ch, msg)
    set vb
    let s:flashing_tim = timer_start(500, 'FlashScreen', {'repeat':-1})
    echo "To stop flashing, type 'sh'"
endfunc

func! flash#StopFlash()
    call timer_stop(s:flashing_tim)
    set novb
    echo "Stop flashing"
endfunc

func! flash#Bomb(...)
    call job_start(['sleep'] + a:000, {'exit_cb' : 'StartFlash'})
endfunc


let &cpo = s:save_cpo
unlet s:save_cpo
