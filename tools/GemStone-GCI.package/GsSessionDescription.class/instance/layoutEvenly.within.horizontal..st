toolbuilder
layoutEvenly: arrayOfSpecs within: aRectangle horizontal: isHorizontal

	| increment |
	increment := isHorizontal
					ifTrue: [(aRectangle width / arrayOfSpecs size) @ 0]
					ifFalse: [0 @ (aRectangle height / arrayOfSpecs size)].
	^ arrayOfSpecs withIndexCollect: [:spec :index |
		| topLeft bottomRight |
		topLeft := aRectangle topLeft + ((index - 1) * increment).
		bottomRight := aRectangle bottomRight - ((arrayOfSpecs size - index) * increment).
		(topLeft corner: bottomRight) -> spec]