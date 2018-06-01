private
receiveData
	"Check my connection status and withdraw from the world if the connection has been broken. Append any data that has arrived to receiveBuffer. "

	socket ifNotNil: [
		socket isConnected
			ifTrue: [  "connected"
				waitingForConnection ifTrue: [
					Transcript show: 'Remote hand ', userInitials, ' connected'; cr.
					waitingForConnection := false].
				self appendNewDataToReceiveBuffer]
			ifFalse: [  "not connected"
				waitingForConnection ifFalse: [
					"connection was established, then broken"
					self withdrawFromWorld.
					receiveBuffer := '']]].
