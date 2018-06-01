navigation
previousPage

	self currentIndex <= 1 ifTrue: [^Beeper beep].
	currentIndex := self currentIndex - 1.
	self loadPageWithProgress.