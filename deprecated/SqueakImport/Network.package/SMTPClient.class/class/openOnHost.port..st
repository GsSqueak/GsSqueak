instance creation
openOnHost: hostIP port: portNumber

	| client |
	client := super openOnHost: hostIP port: portNumber.
	client initiateSession.
	^client