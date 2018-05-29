connections
startTransmittingEvents
	"Attempt to broadcast events from this hand to a remote hand on the host with the given address. This method just creates the new socket and initiates a connection; it does not wait for the other end to answer."
	(sendSocket notNil and:[sendSocket isConnected]) ifTrue:[^self].
	Transcript
		show: 'Connecting to remote WorldMorph at ';
		show: (NetNameResolver stringFromAddress: self remoteHostAddress), ' ...'; cr.
	sendSocket := Socket newTCP.
	sendSocket connectTo: self remoteHostAddress port: 54323.
	sendState := #opening.
	owner primaryHand addEventListener: self.