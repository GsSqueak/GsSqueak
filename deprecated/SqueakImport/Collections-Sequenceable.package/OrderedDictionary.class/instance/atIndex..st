accessing
atIndex: integer

	integer > tally ifTrue: [ self error: 'indices are out of bounds' ].
	^order at: integer