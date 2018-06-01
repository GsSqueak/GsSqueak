initialization
initialize

	super initialize.
	remoteWorldExtent := 100@100.  "initial guess"
	socket := nil.
	waitingForConnection := false.
	receiveBuffer := ''.
	sendState := #unconnected.