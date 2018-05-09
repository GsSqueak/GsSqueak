LISP-special forms
letrec: aConsCell
  "(let VARLIST &rest BODY)
	Bind variables according to VARLIST then eval BODY.
	The value of the last form in BODY is returned.
	Each element of VARLIST is a symbol (which is bound to nil) or a list
	(SYMBOL VALUEFORM) (which binds SYMBOL to the value of
	VALUEFORM). All the VALUEFORMs are evaluated before any symbol is
	bound."

  | sublisp |
  sublisp := self subLisp: #'letrec' form: aConsCell body: aConsCell cdr.
  aConsCell car
    ifNotNil: [ 
      aConsCell car
        do: [ :form | 
          | sym |
          sym := sublisp
            checkSymbol:
              (form isSymbol
                ifTrue: [ form ]
                ifFalse: [ form car ]).
          sublisp symbolValuesAdd: sym -> nil ].
      (aConsCell car
        collect: [ :form | 
          form isSymbol
            ifTrue: [ form -> nil ]
            ifFalse: [ form car -> (sublisp evalObject: form cdr car) ] ])
        do: [ :v | sublisp symbolValuesAdd: v ] ].
  (aConsCell cdr ifNil: [ ^ nil ])
    doWithCdr: [ :c :cdr | 
      cdr ifNil: [ ^ sublisp evalTailObject: c ].
      sublisp evalObject: c ]