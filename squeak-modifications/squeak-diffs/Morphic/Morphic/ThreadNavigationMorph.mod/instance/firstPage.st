navigation
firstPage

	listOfPages isEmpty ifTrue: [^Beeper beep].
	currentIndex := 1.
	self loadPageWithProgress.