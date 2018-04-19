*SqCollectionLiterals-*SqCollectionLiterals-testing
beginsWith: sequence
	"Answer true if the receiver starts with the argument collection. The comparison is case-sensitive. Overridden for better performance."

	| index sequenceSize |
	sequence isString ifFalse: [ ^super beginsWith: sequence ].
	((sequenceSize := sequence size) = 0 or: [ self size < sequenceSize ]) ifTrue: [ ^false ].
	index := 0.
	[ (index := index + 1) <= sequenceSize ] whileTrue: [
		(sequence at: index) == (self at: index) ifFalse: [ ^false ] ].
	^true
