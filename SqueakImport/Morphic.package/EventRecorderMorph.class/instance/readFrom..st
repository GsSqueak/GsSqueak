fileIn/Out
readFrom: aStream
	"Private"
	| header |
	header := aStream nextLine.
	(header = 'Event Tape v1 BINARY') ifTrue:[^aStream fileInObjectAndCode].
	(header = 'Event Tape v1 ASCII') ifTrue:[^self readFromV1: aStream].
	"V0 had no header so guess"
	aStream reset.
	header first isDigit ifFalse:[^self convertV0Tape: (aStream fileInObjectAndCode)].
	^self convertV0Tape: (self readFromV0: aStream).
