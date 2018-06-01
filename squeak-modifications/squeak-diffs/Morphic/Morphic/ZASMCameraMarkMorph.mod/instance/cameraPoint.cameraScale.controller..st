as yet unclassified
cameraPoint: aPoint cameraScale: aNumber controller: aController

	self setProperty: #cameraPoint toValue: aPoint.
	self setProperty: #cameraScale toValue: aNumber.
	self setProperty: #cameraController toValue: aController.
	self addMorph: (
		StringMorph contents: aPoint printString,'  ',(aNumber printShowingMaxDecimalPlaces: 3)
	) lock.