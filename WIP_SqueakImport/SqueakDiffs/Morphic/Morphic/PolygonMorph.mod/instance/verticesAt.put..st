editing
verticesAt: anInteger put: aPoint

	self vertices at: anInteger put: aPoint asFloatPoint.
	self computeBounds