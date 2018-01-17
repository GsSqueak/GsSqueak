as yet unclassified
transformMethod: aMethodString

	^ (Parser new parse: aMethodString class: (self class)) preen printString.