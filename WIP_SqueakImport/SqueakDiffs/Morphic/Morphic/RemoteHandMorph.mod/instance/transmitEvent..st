event handling
transmitEvent: aMorphicEvent
	"Transmit the given event to all remote connections."
	| firstEvt |
	self readyToTransmit ifFalse: [^ self].
	self lastEventTransmitted = aMorphicEvent ifTrue: [^ self].
	sendBuffer ifNil: [sendBuffer := WriteStream on: (String new: 10000)].
	sendBuffer nextPutAll: aMorphicEvent storeString; cr.
	self lastEventTransmitted: aMorphicEvent.

	sendSocket isConnected ifTrue:[
		sendState = #opening ifTrue: [
			"connection established; disable TCP delays on sends"
			sendSocket setOption: 'TCP_NODELAY' value: true.
			"send worldExtent as first event"
			firstEvt := MorphicUnknownEvent type: #worldBounds argument: self worldBounds extent.
			sendSocket sendData: firstEvt storeString, (String with: Character cr).
			Transcript
				show: 'Connection established with remote WorldMorph at ';
				show: (NetNameResolver stringFromAddress: sendSocket remoteAddress); cr.
			sendState := #connected].
		sendSocket sendData: sendBuffer contents.
	] ifFalse: [
		owner primaryHand removeEventListener: self.
		sendState = #connected ifTrue: [
			"other end has closed; close our end"
			Transcript
				show: 'Closing connection with remote WorldMorph at ';
				show: (NetNameResolver stringFromAddress: sendSocket remoteAddress); cr.
			sendSocket close.
		sendState := #closing]].

	sendBuffer reset.
