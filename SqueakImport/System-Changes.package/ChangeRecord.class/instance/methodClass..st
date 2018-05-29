access
methodClass: anEnvironment
	| methodClassName methodClass |
	(#(method #classComment) includes: type) ifFalse: [ ^ nil ].
	methodClassName := class substrings
		ifEmpty: [ ^ nil ]
		ifNotEmptyDo:
			[ : parts | parts first asSymbol ].
	(anEnvironment includesKey: methodClassName) ifFalse: [ ^ nil ].
	methodClass := anEnvironment at: methodClassName.
	^ meta
		ifTrue: [ methodClass class ]
		ifFalse: [ methodClass ]