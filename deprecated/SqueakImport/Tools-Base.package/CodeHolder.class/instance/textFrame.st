toolbuilder
textFrame
	| topOffset bottomOffset |
	topOffset := self wantsOptionalButtons
		ifTrue: [self buttonHeight]
		ifFalse: [0].
	bottomOffset := self wantsAnnotationPane
		ifTrue: [self annotationPaneHeight negated]
		ifFalse: [0].
	^LayoutFrame new
		leftFraction: 0 offset: 0;
		topFraction: 0 offset: topOffset;
		rightFraction: 1 offset: 0;
		bottomFraction: 1 offset: bottomOffset