as yet unclassified
gotoMark

	self cameraController 
		turnToPage: (self valueOfProperty: #bookPage)
		position: (self valueOfProperty: #cameraPoint) 
		scale: (self valueOfProperty: #cameraScale)
		transition: (self valueOfProperty: #transitionSpec).
	self setCameraValues.


