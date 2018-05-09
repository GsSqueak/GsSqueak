testing
applyInTailTo: aConsCell inLisp: aLisp asMacro: mflag
  ^ form
    applyTo: aConsCell
    inLisp: aLisp
    withEnvironment: environment
    noSubLisp: true