label
relabel
	| newLabel |
	newLabel := UIManager default 
		request: 'New title for this window' translated
		initialAnswer: labelString.
	newLabel isEmpty ifTrue: [^self].
	(model windowReqNewLabel: newLabel)
		ifTrue: [self setLabel: newLabel]