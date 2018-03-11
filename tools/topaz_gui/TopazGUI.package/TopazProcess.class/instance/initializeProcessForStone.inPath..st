initialization
initializeProcessForStone: stoneName inPath: devKitPath.

	"devKitPath is expected to not have trailing slashes"
	process := ExternalOSProcess concreteClass new
			programName: devKitPath , '/bin/startTopaz';
			arguments: (Array with: stoneName with: '-l');
			initialStdIn: inPipe reader;
			initialStdOut: outPipe writer;
			initialStdErr: errPipe writer;
			initialEnvironment: (self initializedEnvironmentForPath: devKitPath);
			initialize;
			forkChild