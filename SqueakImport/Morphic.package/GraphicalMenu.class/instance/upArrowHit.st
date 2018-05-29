event handling
upArrowHit
	currentIndex := currentIndex + 1.
	(currentIndex > formChoices size) ifTrue: [currentIndex := 1].
	self updateThumbnail
	
