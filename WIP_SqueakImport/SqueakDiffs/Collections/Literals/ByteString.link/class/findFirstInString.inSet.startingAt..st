primitives
findFirstInString: aString  inSet: inclusionMap  startingAt: start

	| i stringSize |
	inclusionMap size ~= 256 ifTrue: [ ^0 ].

	i := start.
	stringSize := aString size.
	[ i <= stringSize and: [ (inclusionMap at: (aString basicAt: i) + 1) = 0 ] ] whileTrue: [ 
		i := i + 1 ].

	i > stringSize ifTrue: [ ^0 ].
	^i
