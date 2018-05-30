writing
writeNumber:aNumber
	super writeNumber:(aNumber isInteger ifTrue:[aNumber] ifFalse:[aNumber roundTo:0.001]).
