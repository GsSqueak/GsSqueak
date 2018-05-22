as yet unclassified
keyboard
	eventUsed ifFalse: [eventUsed := true.  ^ event keyCharacter].
	^ nil