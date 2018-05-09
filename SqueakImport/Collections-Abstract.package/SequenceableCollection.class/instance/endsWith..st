testing
endsWith: sequence
	"Answer true if the receiver ends with the argument collection."
	
	| sequenceSize offset |
	((sequenceSize := sequence size) = 0 or: [ (offset := self size - sequence size) < 0 ]) ifTrue: [ ^false ].
	1 to: sequenceSize do: [ :index |
		(sequence at: index) = (self at: index + offset) ifFalse: [ ^false ] ].
	^true