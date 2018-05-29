navigation
nextPage

	self currentIndex >= listOfPages size ifTrue: [^Beeper beep].
	currentIndex := self currentIndex + 1.
	self loadPageWithProgress.