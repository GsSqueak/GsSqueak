handling
defaultAction
	"No one has handled this error, but now give them a chance to decide how to debug it.  If none handle this either then open debugger (see UnhandedError-defaultAction)"
	self _env0 halt. "until now GsSqueak does not support error handling so we need a gs debugger"
	UnhandledError signalForException: self
