process communication
receiveOutputAfter: milli

	(Delay forMilliseconds: milli) wait.
	^ self topazProcess outPipe reader upToEnd