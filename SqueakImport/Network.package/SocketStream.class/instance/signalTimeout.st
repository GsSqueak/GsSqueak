private-socket
signalTimeout
	self shouldSignal ifFalse: [^ self]. 
	ConnectionTimedOut signal: 'Data receive timed out.'