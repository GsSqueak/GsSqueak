display box access
computeBoundingBox
	| aRectangle aPoint |
	aRectangle := center - radius + form offset extent: form extent + (radius * 2) asPoint.
	aPoint := center + form extent.
	quadrant = 1 ifTrue: [^ aRectangle encompass: center x @ aPoint y].
	quadrant = 2 ifTrue: [^ aRectangle encompass: aPoint x @ aPoint y].
	quadrant = 3 ifTrue: [^ aRectangle encompass: aPoint x @ center y].
	quadrant = 4 ifTrue: [^ aRectangle encompass: center x @ center y]