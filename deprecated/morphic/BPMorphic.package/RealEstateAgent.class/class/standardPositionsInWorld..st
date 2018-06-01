accessing
standardPositionsInWorld: aWorldOrNil 
	"Return a list of standard window positions -- this may have one, two,
	or four of them, depending on the size and shape of the display
	screen. "
	| _gsSqueakTemp_anArea _gsSqueakTemp_aList _gsSqueakTemp_midX _gsSqueakTemp_midY |
	_gsSqueakTemp_anArea := self maximumUsableAreaInWorld: aWorldOrNil.
	_gsSqueakTemp_midX := self scrollBarSetback + (_gsSqueakTemp_anArea width - self scrollBarSetback // 2).
	_gsSqueakTemp_midY := self screenTopSetback + (_gsSqueakTemp_anArea height - self screenTopSetback // 2).
	_gsSqueakTemp_aList := OrderedCollection with: self scrollBarSetback @ self screenTopSetback.
	self windowColumnsDesired > 1
		ifTrue: [_gsSqueakTemp_aList add: _gsSqueakTemp_midX @ self screenTopSetback].
	self windowRowsDesired > 1
		ifTrue: [_gsSqueakTemp_aList add: self scrollBarSetback @ (_gsSqueakTemp_midY + self screenTopSetback).
			self windowColumnsDesired > 1
				ifTrue: [_gsSqueakTemp_aList add: _gsSqueakTemp_midX @ (_gsSqueakTemp_midY + self screenTopSetback)]].
	^ _gsSqueakTemp_aList