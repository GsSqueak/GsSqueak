navigation
skipOverNext
	
	| target |

	(target := self currentIndex + 2) > listOfPages size ifTrue: [^Beeper beep].
	currentIndex := target.
	self loadPageWithProgress.
