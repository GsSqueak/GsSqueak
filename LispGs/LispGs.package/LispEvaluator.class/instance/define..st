LISP-special forms
define: aConsCell
  | s val |
  (s := aConsCell car) isSymbol
    ifTrue: [ val := self evalObject: aConsCell cdr car ]
    ifFalse: [ 
      (aConsCell car isConsCell and: [ (s := aConsCell car car) isSymbol ])
        ifTrue: [ 
          | spec |
          spec := aConsCell car cdr.
          spec isSymbol
            ifTrue: [ 
              spec := {#'&rest'.
              spec} asConsList ].
          val := self
            makeClosureFor:
              (((ConsCell car: #'lambda') addLast: spec) append: aConsCell cdr) ]
        ifFalse: [ self lispError: 'symbol expected, got ' , s asString ] ].
  self symbolValuesAdd: (self checkSymbol: s) -> val.
  ^ s