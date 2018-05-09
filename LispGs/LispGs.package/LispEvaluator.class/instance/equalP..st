LISP-primitives
equalP: aConsCell
  "(equal? O1 O2)
	Return #t if O1 and O2 are similar objects."

  ^ self class test: aConsCell car = aConsCell cdr car