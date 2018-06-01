initialization
initialize
	"initialize the state of the receiver"
	super initialize.
	self
		makeVertices: self defaultSides
		starRatio: self defaultStarRatio
		withCenter: self defaultCenter
		withPoint: self defaultFirstVertex.
	self computeBounds