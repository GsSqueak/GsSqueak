fileIn/Out
checkTape
	"See if this tape was already converted to the new format"

	tape ifNil: [^self].
	tape isEmpty ifTrue: [^self].
	(tape first isKindOf: Association) 
		ifTrue: [tape := self convertV0Tape: tape]