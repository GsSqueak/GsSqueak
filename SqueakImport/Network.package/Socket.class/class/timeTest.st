examples
timeTest
	"Socket timeTest"

	| serverName serverAddr s |
	Transcript show: 'initializing network ... '.
	self initializeNetwork.
	Transcript
		show: 'ok';
		cr.
	serverName := UIManager default request: 'What is your time server?'
				initialAnswer: 'localhost'.
	serverName isEmpty 
		ifTrue: 
			[^Transcript
				show: 'never mind';
				cr].
	serverAddr := NetNameResolver addressForName: serverName timeout: 10.
	serverAddr = nil 
		ifTrue: [self error: 'Could not find the address for ' , serverName].
	s := self new.
	Transcript
		show: '---------- Connecting ----------';
		cr.
	s connectTo: serverAddr port: 13.	"13 is the 'daytime' port number"
	s waitForConnectionUntil: (self deadlineSecs: 1).
	Transcript show: 'the time server reports: ' , s receiveData.
	s closeAndDestroy.
	Transcript
		show: '---------- Connection Closed ----------';
		cr