squeak protocol
wait
	"Convert this duration in a delay and wait once. Return the created delay so that the client can wait on it again if needed.
	
	Do-it: 3 minutes wait"
	
	| delay |
	delay := self asDelay.
	delay wait.
	^ delay