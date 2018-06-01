updating
update: aspect 
	aspect == #buttons
		ifTrue: [self updateButtonExtent].
	^ super update: aspect