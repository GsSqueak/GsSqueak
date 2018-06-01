queries
isOtherEndConnected
	"Return true if this socket is connected, or this end has closed the connection but not the other end, so we can still receive data."

	| state |
	socketHandle ifNil: [ ^false ].
	(state := self primSocketConnectionStatus: socketHandle) == Connected ifTrue: [ ^true ].
	^state == ThisEndClosed
