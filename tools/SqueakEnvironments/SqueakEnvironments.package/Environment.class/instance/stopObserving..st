observing
stopObserving: anEnvironment 
	policies := policies
				reject: [:ea | ea environment == anEnvironment]