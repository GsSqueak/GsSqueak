event handling
downArrowHit
	currentIndex := currentIndex - 1.
	(currentIndex < 1) ifTrue:  [currentIndex := formChoices size].
	self updateThumbnail
	
