as yet unclassified
composeOneLine
	| _gsSqueakTemp_rectangles |
	_gsSqueakTemp_rectangles := theContainer rectanglesAt: currentY height: defaultLineHeight.
	_gsSqueakTemp_rectangles notEmpty
		ifTrue: [(self composeAllRectangles: _gsSqueakTemp_rectangles)
				ifNil: [^ nil]]
		ifFalse: [currentY := currentY + defaultLineHeight].
	self checkIfReadyToSlide