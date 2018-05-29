accessing
action: anAction	
	action := nil.
	anAction isSymbol ifTrue:[^super action: anAction].
	action := anAction.