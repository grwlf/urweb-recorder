{ libraries ? {}
, uwb ? (import <urweb-build>) { inherit libraries; }
} :

with uwb;

rec {

  oilprice = mkExe {
    name = "Recorder";
    dbms = "sqlite";

    libraries = {
      xmlw = external ./lib/urweb-xmlw;
      soup = external ./lib/urweb-soup;
      prelude = external ./lib/urweb-prelude;
      monad-pack = external ./lib/urweb-monad-pack;
      bootstrap = external ./lib/uru3/Bootstrap;
      uru = external ./lib/uru3/Uru;
    };

    statements = [
      (set "allow mime text/css")
      (set "allow url https://github.com/grwlf/urweb-recorder*")
      (sys "list")
      (sys "char")
      (sys "string")
      (sys "option")
      (embed ./src/Recorder.js)
      (embed ./src/Recorder_Main.js)
      (embed-js ./src/Recorder_FFI.js)
      (src1 ./src/Recorder.ur)
      (src1 ./src/Main.ur)
    ];
  };

}
