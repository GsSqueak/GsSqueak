process communication
command: aString

	self sendInput: aString , Character lf , Character lf.
	^ self receiveCommandOutput