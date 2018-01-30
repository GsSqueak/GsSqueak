compiling
compile: text environment: anEnvironment classified: category withStamp: changeStamp notifying: requestor
	^ self 
		compile: text 
		environment: anEnvironment 
		classified: category 
		withStamp: changeStamp 
		notifying: requestor 
		logSource: self acceptsLoggingOfCompilation