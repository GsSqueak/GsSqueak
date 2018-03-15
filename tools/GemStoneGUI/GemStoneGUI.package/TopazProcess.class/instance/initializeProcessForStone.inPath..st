initialization
initializeProcessForStone: stoneName inPath: devkitPath

	| directory topazFile |
	directory := FileDirectory on: devkitPath.
	topazFile := directory / #bin / #startTopaz.
	topazFile exists ifFalse: [
		self error: 'Could not find the topaz binaries at the given directory'].
	process := ExternalOSProcess concreteClass new
			programName: topazFile fullName;
			arguments: (Array with: stoneName with: '-l');
			initialStdIn: inPipe reader;
			initialStdOut: outPipe writer;
			initialStdErr: errPipe writer;
			initialEnvironment: (self initializedEnvironmentForPath: directory fullName);
			initialize;
			forkChild