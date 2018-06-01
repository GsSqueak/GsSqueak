editing keys
swapChars: aKeyboardEvent 
	"Triggered byCmd-Y;. Swap two characters, either those straddling the
	insertion point, or the two that comprise the selection. Suggested by
	Ted Kaehler. "
	| _gsSqueakTemp_currentSelection _gsSqueakTemp_aString _gsSqueakTemp_chars |
	(_gsSqueakTemp_chars := self selection) size = 0
		ifTrue: [_gsSqueakTemp_currentSelection := self pointIndex.
			self selectMark: _gsSqueakTemp_currentSelection - 1 point: _gsSqueakTemp_currentSelection]
		ifFalse: [_gsSqueakTemp_chars size = 2
				ifTrue: [_gsSqueakTemp_currentSelection := self pointIndex - 1]
				ifFalse: [morph flash.
					^ true]].
	_gsSqueakTemp_aString := self selection string.
	self
		replaceSelectionWith: (Text string: _gsSqueakTemp_aString reversed attributes: emphasisHere).
	self selectAt: _gsSqueakTemp_currentSelection + 1.
	^ true