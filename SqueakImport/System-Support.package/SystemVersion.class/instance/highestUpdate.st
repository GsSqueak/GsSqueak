accessing
highestUpdate

	^highestUpdate ifNil: [
		highestUpdate := self updates isEmpty
			ifTrue: [ 0 ]
			ifFalse: [ self updates max ] ]