selecting
adjacentTo

	| roundedCornersOffset verticalOffset |
	roundedCornersOffset := MenuMorph roundedMenuCorners
		ifTrue: [Morph preferredCornerRadius negated]
		ifFalse: [0].
	verticalOffset := 2.

	owner isFloating
		ifTrue: [^ {self bounds bottomLeft + (roundedCornersOffset @ verticalOffset)}].
	owner isAdheringToTop
		ifTrue: [^ {self bounds bottomLeft + (roundedCornersOffset @ verticalOffset)}].
	owner isAdheringToLeft
		ifTrue: [^ {self bounds topRight + (roundedCornersOffset @ verticalOffset)}].
	owner isAdheringToBottom
		ifTrue: [^ {self bounds topLeft + (roundedCornersOffset @ verticalOffset)}].
	owner isAdheringToRight
		ifTrue: [^ {self bounds topLeft + (roundedCornersOffset @ verticalOffset negated)}].
	^ {self bounds bottomLeft + (roundedCornersOffset @ 5)}