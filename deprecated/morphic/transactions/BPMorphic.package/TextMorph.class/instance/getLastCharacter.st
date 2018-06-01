accessing
getLastCharacter
	"obtain the last character from the receiver if it is empty, return a
	black dot"
	| _gsSqueakTemp_aString |
	^ (_gsSqueakTemp_aString := text string) size > 0
		ifTrue: [_gsSqueakTemp_aString last asString]
		ifFalse: ['·']