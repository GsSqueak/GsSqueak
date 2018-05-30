initialize-destroy
initialize: socketType
	"Initialize a new socket handle. If socket creation fails, socketHandle will be set to nil."

	self initializeSocketHandleUsing: [ :semaIndex :readSemaIndex :writeSemaIndex |
		self primSocketCreateNetwork: 0
			type: socketType
			receiveBufferSize: DefaultReceiveBufferSize
			sendBufSize: DefaultSendBufferSize
			semaIndex: semaIndex
			readSemaIndex: readSemaIndex
			writeSemaIndex: writeSemaIndex ]