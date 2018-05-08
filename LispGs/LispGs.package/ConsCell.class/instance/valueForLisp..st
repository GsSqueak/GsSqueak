evaluating
valueForLisp: aLisp
  | func |
  "function lookup"
  func := aLisp lookUpFunction: car.
  (aLisp isProcedure: func)
	ifFalse: [^ aLisp evalIrregularProcedure: func withArguments: cdr].
  ^ func applyTo: cdr inLisp: aLisp
