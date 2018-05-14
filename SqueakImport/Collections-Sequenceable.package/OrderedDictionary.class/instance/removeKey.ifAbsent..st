removing
removeKey: key ifAbsent: aBlock

	| result |
	result := super removeKey: key ifAbsent: [ ^aBlock value ].
	(self scanOrderFor: key) ifNotNil: [ :index |
		order 
			replaceFrom: index
			to: tally
			with: order
			startingAt: index + 1 ].
.	order at: tally + 1 put: nil.
	^result