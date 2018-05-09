evaluating
bindingsWithArguments: aConsCell
  "the receiver is a lambda form arguments specification, such as (x y) or
(a &optional b c). return the actual bindings when given aConsCell as arguments.

	this method provides only minimal arguments list parsing:
	handles &rest and &optional (no other keyword implemented).
	&body and . are synonyms of &rest"

  | symbs vals optf bindings n |
  symbs := self.
  (vals := aConsCell) ifNil: [ ^ {(symbs cdr car -> nil)} ].
  optf := false.
  bindings := Array new: symbs safeLength.
  n := 0.
  [ symbs isNil and: [ vals isNil ] ]
    whileFalse: [ 
      | val sym |
      sym := symbs car ifNil: [ LispEvaluator lispError: 'too many arguments' ].
      symbs := symbs cdr.
      n := n + 1.
      sym == #'&optional'
        ifTrue: [ 
          optf := true.
          sym := symbs car.
          symbs := symbs cdr ].
      (sym == #'&rest' or: [ sym == #'&body' ])
        ifTrue: [ 
          val := vals.
          bindings at: n put: symbs car -> val.
          ^ bindings cutAt: n ].
      vals
        ifNil: [ 
          optf
            ifFalse: [ LispEvaluator lispError: 'not enough arguments' ] ].
      val := vals car.
      vals := vals cdr.
      bindings at: n put: sym -> val.
      symbs isSymbol
        ifTrue: [ 
          val := vals.
          bindings at: n + 1 put: symbs -> val.
          ^ bindings cutAt: n + 1 ] ].
  ^ bindings cutAt: n