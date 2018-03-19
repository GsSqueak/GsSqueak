accessing method dictionary
firstPrecodeCommentFor:  selector env: envId

	| source commentStart commentEnd |
	source := self sourceCodeAt: selector asSymbol env: envId ifAbsent: [^ nil].
	commentStart := source findString: '"' startingAt: 1.
	commentEnd := source findString: '"' startingAt: commentStart + 1.
	^ commentEnd > commentStart 
		ifTrue: [source copyFrom: commentStart + 1 to: commentEnd - 1]
		ifFalse: [nil].