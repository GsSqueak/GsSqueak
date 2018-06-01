accessing
selectedValues
	
	| i |
	choice ~~ #accepted ifTrue: [^ nil].
	
	i := 0.
	^ self values select: [:object | i := i + 1. self selection at: i]