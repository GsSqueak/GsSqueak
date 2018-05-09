LISP-primitives
>= aConsCell
  "(>= NUM1 NUM2 &rest NUMS)
	Return t if the arguments (which should be numbers) are in
	decreasing order, with equal arguments allowed"

  aConsCell
    cellsDo: [ :c | 
      c car >= (c cdr car ifNil: [ ^ self trueValue ])
        ifFalse: [ ^ self falseValue ] ]