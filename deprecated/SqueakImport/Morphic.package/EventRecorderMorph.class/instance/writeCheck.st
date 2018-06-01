fileIn/Out
writeCheck
	(saved not and: [self confirm: 'The current tape has not been saved.
Would you like to do so now?']) ifTrue:
		[self writeTape].
