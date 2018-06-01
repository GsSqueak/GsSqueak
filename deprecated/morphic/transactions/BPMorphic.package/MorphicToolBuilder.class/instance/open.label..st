opening
open: anObject label: aString 
	"Build an open the object, labeling it appropriately if it is a window.
	Answer the widget opened."
	| _gsSqueakTemp_morph |
	_gsSqueakTemp_morph := self open: anObject.
	_gsSqueakTemp_morph isSystemWindow
		ifTrue: [_gsSqueakTemp_morph setLabel: aString]
		ifFalse: [_gsSqueakTemp_morph name: aString].
	^ _gsSqueakTemp_morph