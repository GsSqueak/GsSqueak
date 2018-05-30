testing
endsWith: sequence
	"Answer true if the receiver ends with the argument collection. The comparison is case-sensitive."
	
	| index sequenceSize offset |
	sequence isString ifFalse: [ ^ super endsWith: sequence ].
	((sequenceSize := sequence size) = 0 or: [ (offset := self size - sequenceSize) < 0 ]) ifTrue: [ ^false ].
	index := 0.
	[ (index := index + 1) <= sequenceSize ] whileTrue: [
		(sequence at: index) == (self at: index + offset) ifFalse: [ ^false ] ].
	^true
