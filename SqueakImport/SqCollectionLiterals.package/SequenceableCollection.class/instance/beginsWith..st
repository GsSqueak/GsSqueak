*SqCollectionLiterals-*SqCollectionLiterals-testing
beginsWith: sequence
	"Answer true if the receiver starts with the argument collection."
	
	| sequenceSize |
	((sequenceSize := sequence size) = 0 or: [ self size < sequenceSize ]) ifTrue: [ ^false ].
	1 to: sequenceSize do: [ :index |
		(sequence at: index) = (self at: index) ifFalse: [ ^false ] ].
	^true
