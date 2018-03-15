accessing
clearPipes

	^ self outPipe reader upToEndOfAvailableData ,
		self errPipe reader upToEndOfAvailableData