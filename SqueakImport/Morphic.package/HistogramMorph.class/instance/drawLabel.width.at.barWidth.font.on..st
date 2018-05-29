drawing
drawLabel: aString width: aNumber at: aPoint barWidth: barWidth font: aFont on: aCanvas

	aNumber <= barWidth
		ifTrue: [aCanvas drawString: aString at: aPoint font: aFont color: Color black]
		ifFalse: [
			| c  |
			c := Display defaultCanvasClass extent: aNumber @ aFont height.
			c drawString: aString at: 0 @ 0  font: aFont color: Color black.
			aCanvas paintImage: (c form rotateBy: -90 smoothing: 3) at: aPoint].