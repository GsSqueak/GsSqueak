accessing
scalePoint: aPoint

	scalePoint := self keepAspectRatio
		ifTrue: [aPoint max: aPoint transposed]
		ifFalse: [aPoint].
	self layoutChanged.