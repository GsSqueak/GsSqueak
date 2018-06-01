opening
openDebugger: aSpec label: aString

	| morph |
	morph := self openDebugger: aSpec.
	morph isSystemWindow
		ifTrue: [morph setLabel: aString]
		ifFalse: [morph name: aString].
	^ morph