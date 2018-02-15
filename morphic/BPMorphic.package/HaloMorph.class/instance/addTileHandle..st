handles
addTileHandle: haloSpec 
	"Add the 'tear-off-tile' handle from the spec"
	self
		addHandle: haloSpec
		on: #mouseDown
		send: #tearOffTileForTarget:with:
		to: self