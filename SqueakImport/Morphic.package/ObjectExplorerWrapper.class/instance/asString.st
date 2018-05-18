converting
asString
	| explorerString label separator |
	explorerString := 
		[self object asExplorerString]
			on: Error 
			do: ['<error: ', self object class name, ' in asExplorerString: evaluate "' , self itemName , ' asExplorerString" to debug>'].
	(explorerString includes: Character cr)
		ifTrue: [explorerString := explorerString withSeparatorsCompacted].

	label := self itemName ifNil: [''].
	(label includes: Character cr)
		ifTrue: [label := label withSeparatorsCompacted].
	 
	separator := self class showContentsInColumns
		ifTrue: [String tab]
		ifFalse: [label ifEmpty: [''] ifNotEmpty: [': ']].

	^ '{1}{2}{3}' format: {label. separator. explorerString}