private
listenLoop
	"Private! This loop is run in a separate process. It will establish up to maxQueueLength connections on the given port."
	"Details: When out of sockets or queue is full, retry more frequently, since a socket may become available, space may open in the queue, or a previously queued connection may be aborted by the client, making it available for a fresh connection."
	"Note: If the machine is disconnected from the network while the server is running, the currently waiting socket will go from 'isWaitingForConnection' to 'unconnected', and attempts to create new sockets will fail. When this happens, delete the broken socket and keep trying to create a socket in case the network connection is re-established. Connecting and disconnecting was tested under PPP on Mac system 8.1. It is not if this will work on other platforms."


	| newConnection |
	"We'll accept four simultanous connections at the same time"
	NetNameResolver useOldNetwork
		ifFalse: [ socket := self createListeningSocketWithBacklog: 4 ]
		ifTrue: [
			socket := Socket newTCP.
			socket listenOn: portNumber backlogSize: 4 ].
	"If the listener is not valid then the we cannot use the
	BSD style accept() mechanism."
	socket isValid ifFalse: [^self oldStyleListenLoop].
	[
		socket isValid ifFalse: [
			"socket has stopped listening for some reason"
			socket destroy.
			(Delay forMilliseconds: 10) wait.
			^self listenLoop ].
		newConnection := socket 
			waitForAcceptFor: 10
			ifTimedOut: [ nil ].
		(newConnection notNil and: [newConnection isConnected]) ifTrue: [
			accessSema critical: [connections addLast: newConnection.].
			newConnection := nil.
			self changed].
		self pruneStaleConnections] repeat