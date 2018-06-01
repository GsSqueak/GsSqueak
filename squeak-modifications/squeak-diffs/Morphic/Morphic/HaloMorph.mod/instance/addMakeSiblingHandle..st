handles
addMakeSiblingHandle: haloSpec
	"Add the halo handle that allows a sibling instance to be torn off, or, if the shift key is down, for a deep-copy duplicate to be made."

	self addHandle: haloSpec on: #mouseDown send: #doMakeSiblingOrDup:with: to: self

