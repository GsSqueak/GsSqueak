editing
insertVertexAt: anIndex put: aValue
	"New vertexs are unclamped."
	"Note: order is important. 
	The clamps array must match vertex size before setVertices: is performed."
	slopeClamps := slopeClamps 
		copyReplaceFrom: anIndex + 1 to: anIndex with: (Array with: nil).
	self setVertices: (vertices copyReplaceFrom: anIndex + 1 to: anIndex 
									with: (Array with: aValue)).