geometry
extent: aPoint
	
	self handleResizeAction: [
		(bounds extent closeTo: aPoint)
			ifTrue: [false]
			ifFalse: [
				super extent: aPoint.
				owner ifNotNil: [owner layoutChanged].
				true]].