handles
addViewHandle: haloSpec 
	"Add the 'open viewer' handle from the halo spec"
	self
		addHandle: haloSpec
		on: #mouseDown
		send: #openViewerForTarget:with:
		to: self