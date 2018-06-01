display
displayDumbbellCursorOn: aCanvas at: leftX in: line

	| w |
	w := 2.
	self focused ifFalse: [^ w].
	
	1 to: w
		do: 
			[:i | 
			"Draw caret triangles at top and bottom"

			aCanvas fillRectangle: ((leftX - w + i - 1) @ (line top + i - 1) 
						extent: ((w - i) * 2 + 3) @ 1)
				color: self caretColor.
			aCanvas fillRectangle: ((leftX - w + i - 1) @ (line bottom - i) 
						extent: ((w - i) * 2 + 3) @ 1)
				color: self caretColor].
	
	aCanvas
		line: leftX @ line top
		to: leftX @ (line bottom-1)
		color: self caretColor.
	
	^ w