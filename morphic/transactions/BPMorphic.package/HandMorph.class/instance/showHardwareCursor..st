drawing
showHardwareCursor: aBool 
	"Show/hide the current hardware cursor as indicated."
	| _gsSqueakTemp_cursor |
	_gsSqueakTemp_cursor := hardwareCursor
				ifNil: [aBool
						ifTrue: [Cursor normal]
						ifFalse: [Cursor blank]].
	Cursor currentCursor == _gsSqueakTemp_cursor
		ifFalse: [_gsSqueakTemp_cursor show]