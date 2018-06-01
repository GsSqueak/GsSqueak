private-socket
signalClosed
	self shouldSignal ifFalse: [^ self]. 
	ConnectionClosed signal: 'Connection closed while waiting for data.'