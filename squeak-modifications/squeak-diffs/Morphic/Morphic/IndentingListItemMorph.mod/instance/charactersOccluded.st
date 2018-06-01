private
charactersOccluded
	"Answer the number of characters occluded in my #visibleList by my right edge."
	| listIndex leftEdgeOfRightmostColumn eachString indexOfLastVisible iconWidth totalWidth |
	listIndex := 0.
	leftEdgeOfRightmostColumn := container columns
		ifNil: [ 0 ]
		ifNotNil:
			[ : cols | (1 to: cols size - 1)
				inject: 0
				into:
					[ : sum : each | sum + (self widthOfColumn: each) ] ].
	eachString := container columns
		ifNil: [ self complexContents asString ]
		ifNotNil:
			[ : cols | self contentsAtColumn: container columns size ].
	iconWidth := self icon
		ifNil: [ 0 ]
		ifNotNil:
			[ : icon | icon width + 2 ].
	totalWidth := self toggleBounds right.
	indexOfLastVisible := ((1 to: eachString size)
		detect:
			[ : stringIndex | (totalWidth:=totalWidth+(self fontToUse widthOf: (eachString at: stringIndex))) >
				(container width -
					(container vIsScrollbarShowing
						ifTrue: [ container vScrollBar width ]
						ifFalse: [ 0 ]) - iconWidth - leftEdgeOfRightmostColumn) ]
		ifNone: [ eachString size + 1 ]) - 1.
	^ eachString size - indexOfLastVisible