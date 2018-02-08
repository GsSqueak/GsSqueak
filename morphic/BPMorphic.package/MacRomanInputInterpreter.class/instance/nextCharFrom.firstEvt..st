as yet unclassified
nextCharFrom: sensor firstEvt: evtBuf 
	| _gsSqueakTemp_keyValue |
	_gsSqueakTemp_keyValue := evtBuf third.
	^ _gsSqueakTemp_keyValue asCharacter macToSqueak