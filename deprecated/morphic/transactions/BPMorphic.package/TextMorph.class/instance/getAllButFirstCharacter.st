scripting access
getAllButFirstCharacter
	"Obtain all but the first character from the receiver; if that would be
	empty, return a black dot"
	| _gsSqueakTemp_aString |
	^ (_gsSqueakTemp_aString := text string) size > 1
		ifTrue: [_gsSqueakTemp_aString copyFrom: 2 to: _gsSqueakTemp_aString size]
		ifFalse: ['·']