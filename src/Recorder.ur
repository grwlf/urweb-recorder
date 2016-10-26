con dpage = Uru.dpage
con need = [JQ=unit]
con out = need ++ [RECORDER=unit]

fun add [t:::{Type}] [t~out]
  (f:record (dpage (t ++ out)) -> transaction page)
  (r:record (dpage (t ++ need)))
  : transaction page =

  let
    val h = <xml>
              {Script.insert Uru.javascript Recorder_js.url}
              {Script.insert Uru.javascript Recorder_Main_js.url}
              {Script.insert Uru.javascript Recorder_FFI_js.url}
            </xml>
  in
    f (Uru.addHeader h (Uru.addTag [#RECORDER] {} r))
  end


val recorder_toggle = Recorder_FFI_js.recorder_toggle

