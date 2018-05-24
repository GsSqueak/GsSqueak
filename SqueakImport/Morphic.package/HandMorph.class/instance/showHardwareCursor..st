drawing
showHardwareCursor: aBool
	"Show/hide the current hardware cursor as indicated."
	| cursor |
	cursor :=  hardwareCursor ifNil:[aBool ifTrue:[Cursor normal] ifFalse:[Cursor blank]].
	Cursor currentCursor == cursor ifFalse: [cursor show].
