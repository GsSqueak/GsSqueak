multi-action sessions
sleep
	"If still connected, break the connection"

	self quitClient.
	self keepAlive: false