morphic ui
representsSameBrowseeAs: anotherModel
	^ self hasUnacceptedEdits not
	and: [ messageList = anotherModel messageList ]