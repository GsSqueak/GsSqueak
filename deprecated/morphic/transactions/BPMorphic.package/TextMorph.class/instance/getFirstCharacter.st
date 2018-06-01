accessing
getFirstCharacter
	"obtain the first character from the receiver if it is empty, return a 
	black dot"
	| _gsSqueakTemp_aString |
	^ (_gsSqueakTemp_aString := text string) isEmpty
		ifTrue: ['·']
		ifFalse: [_gsSqueakTemp_aString first asString]