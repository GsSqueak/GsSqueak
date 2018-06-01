connections
startListening
	"Create a socket and start listening for a connection."

	self stopListening.
	Transcript show: 'My address is ', NetNameResolver localAddressString; cr.
	Transcript show: 'Remote hand ', self userInitials, ' waiting for a connection...'; cr.
	socket := Socket new.
	socket listenOn: 54323.
	waitingForConnection := true.
