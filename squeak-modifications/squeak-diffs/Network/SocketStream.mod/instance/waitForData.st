private-socket
waitForData
	"Wait for data. If shouldTimeout, we will time out if nothing arrives, otherwise we wait indefinitely"

	self shouldTimeout
		ifTrue: [socket waitForDataFor: self timeout
			ifClosed: [self signalClosed]
			ifTimedOut: [self signalTimeout]]
		ifFalse: [socket waitForDataIfClosed: [self signalClosed]]