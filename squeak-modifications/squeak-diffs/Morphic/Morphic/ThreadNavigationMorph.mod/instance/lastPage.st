navigation
lastPage

	listOfPages isEmpty ifTrue: [^Beeper beep].
	currentIndex := listOfPages size.
	self loadPageWithProgress.