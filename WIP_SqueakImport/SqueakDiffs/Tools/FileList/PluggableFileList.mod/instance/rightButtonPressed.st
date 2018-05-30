accepting/cancelling
rightButtonPressed

	(canAcceptBlock value: directory value: fileName) ifFalse: [^nil].
	(validateBlock value: directory value: fileName value: newFiles) ifFalse: [^nil].
	accepted := true.
	self changed: #close