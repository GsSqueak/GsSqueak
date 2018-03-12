initialization
initializePipes

	inPipe := OSPipe blockingPipe.
	outPipe := OSPipe bufferedBlockingPipe.
	errPipe := OSPipe bufferedBlockingPipe