as yet unclassified
grabCameraPositionEvent: anEvent morph: aMorph
 
	| mark |
	mark := ZASMCameraMarkMorph new.
	mark 
		cameraPoint: self cameraPoint
		cameraScale: self cameraScale
		controller: self
		page: target.
	anEvent hand attachMorph: mark.