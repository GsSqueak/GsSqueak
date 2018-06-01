fileIn/Out
convertV0Tape: anArray
	"Convert the tape into the new format"
	| lastKey |
	lastKey := 0.
	^anArray collect:[:assn| | evt | 
		evt := assn value.
		evt setTimeStamp: (lastKey := lastKey + assn key).
		evt]