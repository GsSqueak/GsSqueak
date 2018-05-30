halos and balloon help
addOptionalHandlesTo: aHalo box: box
	aHalo addHandleAt: box center color: Color magenta icon: nil on: #mouseDown send: #createSample to: self.