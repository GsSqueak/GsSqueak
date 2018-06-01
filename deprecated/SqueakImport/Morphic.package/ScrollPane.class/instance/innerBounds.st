geometry
innerBounds

	| inner bottomOffset leftOffset rightOffset |
	(retractableScrollBar or: [self vIsScrollbarShowing not])
		ifTrue: [leftOffset := rightOffset := 0]
		ifFalse: [
			scrollBarOnLeft
				ifTrue: [
					leftOffset := self scrollBarThickness - self borderWidth.
					rightOffset := 0.]
				ifFalse: [
					leftOffset := 0.
					rightOffset := self scrollBarThickness - self borderWidth]].
			
	(retractableScrollBar or: [self hIsScrollbarShowing not])
		ifTrue: [bottomOffset := 0]
		ifFalse: [bottomOffset := self scrollBarThickness - self borderWidth].
	
	inner := super innerBounds.
	^ (inner left + leftOffset) @ (inner top "+ topOffset")
		corner: (inner right - rightOffset) @ (inner bottom - bottomOffset)