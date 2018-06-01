private
setFrame: aRectangle in: widget
	| frame |
	aRectangle ifNil:[^nil].
	frame := aRectangle isRectangle
		ifTrue: [self asFrame: aRectangle]
		ifFalse: [aRectangle]. "assume LayoutFrame"
	widget layoutFrame: frame.
	widget hResizing: #spaceFill; vResizing: #spaceFill.