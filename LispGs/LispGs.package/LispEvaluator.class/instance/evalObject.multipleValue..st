private - interpreter
evalObject: anObject multipleValue: mvflag 
	| val cache |
	val := anObject valueForLisp: self.
	(val isLispValues and: [mvflag not])
		ifTrue: [val := val asOneLispValue].
	^ val
