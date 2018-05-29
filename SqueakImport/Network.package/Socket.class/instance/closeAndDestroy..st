connection open/close
closeAndDestroy: timeoutSeconds
	"First, try to close this connection gracefully. If the close attempt fails or times out, abort the connection. In either case, destroy the socket. Do nothing if the socket has already been destroyed (i.e., if its socketHandle is nil)."

	socketHandle ifNil: [ ^self ].
	self isConnected ifTrue: [
		self close.  "Close this end.".
		(self waitForDisconnectionFor: timeoutSeconds) ifFalse: [
			"The other end has not closed the connect yet, so we will just abort it."
			self primSocketAbortConnection: socketHandle ] ].
	self destroy