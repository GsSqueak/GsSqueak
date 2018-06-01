as yet unclassified
cameraPoint: aPoint cameraScale: aNumber controller: aController page: aBookPage
 
	self setProperty: #cameraPoint toValue: aPoint.
	self setProperty: #cameraScale toValue: aNumber.
	self setProperty: #cameraController toValue: aController.
	self setProperty: #bookPage toValue: aBookPage.
	self addMorphBack: (ImageMorph new image: (aBookPage imageForm scaledToSize: 80@80)) lock.
	self setBalloonText: aPoint rounded printString,'  ',(aNumber printShowingMaxDecimalPlaces: 3)