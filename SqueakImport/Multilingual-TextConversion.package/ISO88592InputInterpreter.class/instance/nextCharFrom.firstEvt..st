as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf

	| keyValue |
	keyValue := evtBuf third.
	^ converter toSqueak: keyValue asCharacter.
