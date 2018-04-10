handles
addFewerHandlesHandle: haloSpec 
	self
		addHandle: haloSpec
		on: #mouseDown
		send: #addSimpleHandles
		to: self