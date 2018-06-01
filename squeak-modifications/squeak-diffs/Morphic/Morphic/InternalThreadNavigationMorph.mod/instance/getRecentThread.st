navigation
getRecentThread

	self switchToThread: (
		ProjectHistory currentHistory mostRecentThread ifNil: [^self]
	)

