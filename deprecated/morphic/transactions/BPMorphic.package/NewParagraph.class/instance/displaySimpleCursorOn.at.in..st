display
displaySimpleCursorOn: aCanvas at: leftX in: line 
	self focused
		ifFalse: [^ 1].
	aCanvas
		line: leftX @ (line top + 1)
		to: leftX @ (line bottom - 1)
		color: self caretColor.
	aCanvas
		line: leftX + 1 @ (line top + 1)
		to: leftX + 1 @ (line bottom - 1)
		color: (self caretColor alpha: 0.3).
	^ 1