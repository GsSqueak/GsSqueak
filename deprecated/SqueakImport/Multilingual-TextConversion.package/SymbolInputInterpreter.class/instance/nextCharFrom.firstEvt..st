as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf

	| keyValue |
	keyValue := evtBuf third.
	evtBuf fifth > 1 ifTrue: [^ keyValue asCharacter macToSqueak].
	^ (self symbolKeyValueToUnicode: keyValue) asCharacter.
