printing
buttonString
	"Return a string identifying the currently pressed buttons"
	| _gsSqueakTemp_string |
	_gsSqueakTemp_string := ''.
	self redButtonPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'red '].
	self yellowButtonPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'yellow '].
	self blueButtonPressed
		ifTrue: [_gsSqueakTemp_string := _gsSqueakTemp_string , 'blue '].
	^ _gsSqueakTemp_string