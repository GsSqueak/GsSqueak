as yet unclassified
pageRectangles

	| pageBounds allPageRects maxExtent |

	geeMail ifNotNil: [
		allPageRects := geeMail pageRectanglesForPrinting.
		allPageRects ifNotNil: [
			maxExtent := allPageRects inject: 0@0 into: [ :max :each |
				max max: each extent
			].
			computedBounds := 0@0 extent: maxExtent.
			^allPageRects
		].
	].
	pageBounds := self bounds.
	allPageRects := OrderedCollection new.
	[pageBounds top <= pasteUp bottom] whileTrue: [
		allPageRects add: pageBounds.
		pageBounds := pageBounds translateBy: 0 @ pageBounds height.
	].
	^allPageRects
