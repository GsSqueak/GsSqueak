copying
deepCopy
	"Don't want to copy the container (etc) or fonts in the TextStyle."
	| _gsSqueakTemp_new |
	_gsSqueakTemp_new := self copy.
	_gsSqueakTemp_new
		textStyle: textStyle copy
		lines: lines copy
		text: text deepCopy.
	^ _gsSqueakTemp_new