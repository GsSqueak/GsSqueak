cursor
cursorWrapped: aNumber 
	"Set the cursor to the given number, modulo the number of items I
	contain. Fractional cursor values are allowed."
	| oldRect newRect offset |
	cursor = aNumber
		ifTrue: [^ self].
	self hasSubmorphs
		ifFalse: [cursor := 1.
			^ self].
	oldRect := self selectedRect.
	offset := (self asNumber: aNumber)
				- 1 \\ submorphs size.
	cursor := offset + 1.
	newRect := self selectedRect.
	self indicateCursor
		ifTrue: [self invalidRect: oldRect;
				 invalidRect: newRect]