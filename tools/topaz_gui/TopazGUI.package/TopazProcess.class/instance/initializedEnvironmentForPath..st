initialization
initializedEnvironmentForPath: devKitPath

	| squeakEnvironment |
	squeakEnvironment := OSProcess thisOSProcess environment copy.
	squeakEnvironment
		at: #GS_HOME put: devKitPath;
		at: #PATH put: devKitPath, '/bin:' , (squeakEnvironment at: #PATH).
	^ squeakEnvironment