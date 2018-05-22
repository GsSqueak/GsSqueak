file in/out
couldBeSwappedOut

	self flag: #bob.		"need a better test in multi-project world"
	^self isCurrentProject not