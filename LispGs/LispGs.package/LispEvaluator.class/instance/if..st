LISP-special forms
if: aConsCell
  "(if COND THEN &optional ELSE)
	If COND yields non-nil, do THEN, else do ELSE
	Returns the value of THEN or the value of ELSE.
	If COND yields nil and there is no ELSE, return ()."

  "
	aConsCell length > 3 ifTrue: 
	[self lispError: 'If: too many arguments'].
	
	^ ((self evalObject: aConsCell car) == self falseValue)
	ifFalse: [self evalTailObject: (aConsCell nth: 1)]
	ifTrue: [self evalTailObject: (aConsCell nth: 2 ifAbsent: [^ nil])
	"

  ^ (self evalObject: aConsCell car) == self falseValue
    ifTrue: [ 
      (aConsCell nthCell: 2 ifAbsent: [ ^ nil ])
        doWithCdr: [ :c :cdr | 
          cdr ifNil: [ ^ self evalTailObject: c ].
          self evalObject: c ] ]
    ifFalse: [ self evalTailObject: aConsCell cdr car ]	"we accept more than two arguments, for compatibility with lisp code
	defined in superclasses:"