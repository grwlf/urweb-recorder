
structure R = Recorder

fun main {} : transaction page =
  Uru.run (
  JQuery.add (
  Recorder.add (
  Uru.withBody (fn _ =>
    i1<-fresh;
    i2<-fresh;
    return
      <xml>

      <p>Recorder works again!</p>

      <p>
      <a id={i1}  onclick={fn _ => R.recorder_toggle(i1) ; return {}} >Record</a>
      </p>

      <p>
      <a id={i2} >Save stream</a>
      </p>

      </xml>
  ))))

