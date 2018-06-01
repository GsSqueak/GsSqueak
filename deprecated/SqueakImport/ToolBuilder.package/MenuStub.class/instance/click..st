as yet unclassified
click: aString
	| item |
	item := self items detect: [:ea | ea label = aString] ifNone: [^ self].
	item action isSymbol
		ifTrue: [self model perform: item action]
		ifFalse: [item action value]