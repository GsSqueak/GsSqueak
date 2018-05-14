LISP-primitives
eqP: aConsCell
  "(eq? O1 O2)
	Return t if O1 and O2 are the same object."

  | o1 o2 |
  o1 := aConsCell car.
  o2 := aConsCell cdr car.
  ^ self class
    test:
      (o1 == o2
        or: [ 
          o1 isLispPrimitive
            and: [ o2 isLispPrimitive ]
            and: [ o1 selector == o2 selector ] ])