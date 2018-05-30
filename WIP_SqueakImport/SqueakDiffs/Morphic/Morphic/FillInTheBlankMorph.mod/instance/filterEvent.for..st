events
filterEvent: event for: morph

	(event isKeystroke and: [event keyCharacter = Character escape])
		ifTrue: [event ignore. self cancelDialog].
		
	^ event