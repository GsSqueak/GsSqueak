temps
bindBlockArg: name within: aBlockNode 
	| nArgs |
	(nArgs := aBlockNode nArgsSlot) isNil
		ifTrue: [aBlockNode nArgsSlot: (nArgs := 0)].
	nArgs >= 15
		ifTrue: [^ self notify: 'Too many arguments'].
	aBlockNode nArgsSlot: nArgs + 1.
	^ (self bindTemp: name) beBlockArg; nowHasDef; nowHasRef; yourself