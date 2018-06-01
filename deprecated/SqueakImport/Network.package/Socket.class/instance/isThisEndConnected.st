queries
isThisEndConnected
	"Return true if this socket is connected, other the other end has closed the connection but not this end, so we can still send data."

	| state |
	socketHandle ifNil: [ ^false ].
	(state := self primSocketConnectionStatus: socketHandle) == Connected ifTrue: [ ^true ].
	^state == OtherEndClosed
