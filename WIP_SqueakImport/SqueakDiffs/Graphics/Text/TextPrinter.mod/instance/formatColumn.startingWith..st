formatting
formatColumn: columnNum startingWith: anIndex
	"Format a new column starting at the given string index. Return the string index indicating the start of the next column or nil if no more columns need printing."
	| colRect blk |
	colRect := self columnRect: columnNum.
	anIndex > 1 ifTrue:[para text: (para text copyFrom: anIndex to: para text size)].
	para compositionRectangle: colRect.
	para clippingRectangle: colRect.
	para composeAll.
	para displayOn: form.
	para visibleRectangle corner y <= colRect extent y ifTrue:[^nil].
	"More columns -- find the character block of the last line and adjust clip rect"
	blk := para characterBlockAtPoint: para visibleRectangle bottomLeft.
	para clearVisibleRectangle. "Make sure that the background is clean"
	para clippingRectangle: (colRect topLeft corner: colRect right@blk top).
	para displayOn: form.
	^blk stringIndex.