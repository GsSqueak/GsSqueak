*LispGs
valueForLisp: aLisp
  ^ aLisp symbolValue: self ifNone: [ aLisp lispError: 'no value for symbol ' , self ]
