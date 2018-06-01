updating
update: aspect

	aspect == #buttons
		ifTrue: [self updateButtonExtent].
		
	aspect == #flash
		ifTrue: [self flash].
		
	^ super update: aspect