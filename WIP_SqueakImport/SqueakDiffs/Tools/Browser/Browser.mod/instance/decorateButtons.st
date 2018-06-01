controls
decorateButtons

	super decorateButtons.
	
	self changed: #classCommentIndicated.
	self changed: #instanceMessagesIndicated.
	self changed: #classMessagesIndicated.