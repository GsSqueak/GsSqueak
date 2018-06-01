as yet unclassified
toggleZoom

	self bounds: (
		bounds area > (Display boundingBox area * 0.9) ifTrue: [
			Display extent // 4 extent: Display extent // 2.
		] ifFalse: [
			Display boundingBox
		]
	)

