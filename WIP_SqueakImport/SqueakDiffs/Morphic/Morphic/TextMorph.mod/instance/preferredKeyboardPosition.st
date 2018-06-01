editing
preferredKeyboardPosition
	| default rects |
	default := (self bounds: self bounds in: self world) topLeft.
	paragraph
		ifNil: [^ default].
	rects := paragraph selectionRects.
	rects size = 0
		ifTrue: [^ default].
	^ rects first bottomLeft