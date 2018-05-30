connections
readyToTransmit
	"Return true if the receiver is ready to send."

	(sendState == #connected) ifTrue:[
		 sendSocket sendDone ifFalse:[^false].
		^true].

	sendState == #opening ifTrue:[
		sendSocket isConnected ifTrue:[^true].
		sendSocket isWaitingForConnection ifFalse:[
			Transcript show: 'trying connection again...'; cr.
			sendSocket destroy.
			sendSocket := Socket new.
			sendSocket connectTo: self remoteHostAddress port: 54323]].

	sendState == #closing ifTrue:[
		sendSocket isUnconnectedOrInvalid ifTrue:[
			sendSocket destroy.
			sendState := #unconnected]].

	^false