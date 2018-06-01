enumerating
groupsDo: aBlock 
	"Evaluate aBlock with my elements taken n at a time, where n is the number of arguments of aBlock. Ignore any leftovers at the end."
	
	| index argumentArray numArgs endIndex |
	numArgs := aBlock numArgs.
	numArgs
		caseOf: { 
			[ 0 ] -> [ ^self error: 'At least one block argument expected.' ].
			[ 1 ] -> [ ^self do: aBlock ].
			[ 2 ] -> [ ^self pairsDo: aBlock ] }
		otherwise: [].
	argumentArray := Array new: numArgs.
	index := 1.
	endIndex := self size - numArgs + 1.
	[ index <= endIndex ] whileTrue: [
		argumentArray
			replaceFrom: 1
			to: numArgs
			with: self
			startingAt: index.
		aBlock valueWithArguments: argumentArray.
		index := index + numArgs ].