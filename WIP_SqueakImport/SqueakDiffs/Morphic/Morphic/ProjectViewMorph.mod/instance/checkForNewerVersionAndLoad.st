events
checkForNewerVersionAndLoad

	self withProgressDo: [
		project loadFromServer
	] 

