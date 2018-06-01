actions
brushable
	"Return true if the current tool uses a brush."
	^ (#(#eyedropper: #fill: #pickup: #stamp: ) indexOf: action)
		= 0"non-brushable"