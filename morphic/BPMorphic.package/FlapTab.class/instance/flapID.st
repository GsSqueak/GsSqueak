access
flapID
	"Answer the receiver's flapID, creating it if necessary"
	^ self knownName
		ifNil: [self acquirePlausibleFlapID]