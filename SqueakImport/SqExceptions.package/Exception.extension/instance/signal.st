*SqExceptions-signaling
signal
	"Ask ContextHandlers in the sender chain to handle this signal.  The default is to execute and return my defaultAction."

	^ self _env0 signal
