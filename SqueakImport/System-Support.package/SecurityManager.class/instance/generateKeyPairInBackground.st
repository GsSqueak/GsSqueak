private
generateKeyPairInBackground
	"SecurityManager default generateKeyPairInBackground"
	"Silently generate a key set on the local machine while running in the background."
	| guesstimate startTime |
	guesstimate := [10 benchmark] timeToRun * 150.
	startTime := Time millisecondClockValue.
	privateKeyPair := nil.
	[self generateLocalKeyPair] fork.
	UIManager default informUserDuring:[:bar|
		[privateKeyPair == nil] whileTrue:[
			bar value:'Initializing Squeak security system (', (Time millisecondClockValue - startTime * 100 // guesstimate) printString,'%)'.
			(Delay forSeconds: 1) wait.
		].
	].
