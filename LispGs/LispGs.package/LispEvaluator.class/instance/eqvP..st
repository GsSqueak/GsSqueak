LISP-primitives
eqvP: aConsCell
  "(eqv? O1 O2)
	Return #t if O1 and O2 are equivalent objects."

  (aConsCell car isConsCell
    or: [ aConsCell car isString ]
    or: [ aConsCell car isArray ])
    ifTrue: [ ^ self class test: aConsCell car == aConsCell cdr car ].
  ^ self class test: aConsCell car = aConsCell cdr car