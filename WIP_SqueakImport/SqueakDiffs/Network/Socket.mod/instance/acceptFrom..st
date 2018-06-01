initialize-destroy
acceptFrom: aSocket
	"Initialize a new socket handle from an accept call"

	self initializeSocketHandleUsing: [ :semaIndex :readSemaIndex :writeSemaIndex |
		self
			primAcceptFrom: aSocket socketHandle
			receiveBufferSize: DefaultReceiveBufferSize
			sendBufSize: DefaultSendBufferSize
			semaIndex: semaIndex
			readSemaIndex: readSemaIndex
			writeSemaIndex: writeSemaIndex ]