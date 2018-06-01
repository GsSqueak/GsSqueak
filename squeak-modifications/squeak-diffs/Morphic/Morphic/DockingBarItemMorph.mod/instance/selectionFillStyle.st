private
selectionFillStyle

	| fill |
	fill := super selectionFillStyle.
	fill isColor ifTrue: [ ^fill ].
	self owner isVertical
		ifFalse: [ fill direction: 0 @ self height ]
		ifTrue: [ fill direction: self width @ 0 ].
	^fill