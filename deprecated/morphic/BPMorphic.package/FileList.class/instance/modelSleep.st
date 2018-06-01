initialization
modelSleep
	"User has exited or collapsed the window -- close any remote
	connection. "
	directory
		ifNotNil: [directory sleep]