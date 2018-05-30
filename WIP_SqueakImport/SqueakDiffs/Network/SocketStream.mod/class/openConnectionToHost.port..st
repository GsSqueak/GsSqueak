instance creation
openConnectionToHost: hostIP port: portNumber
	| socket |
	socket := Socket new.
	socket connectTo: hostIP port: portNumber.
	^self on: socket