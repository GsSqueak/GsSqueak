debugging traps
primitiveSuspend
	"Catch errors before we start the whole morphic error process"

	byteCount > 10000000 ifTrue: [self halt].  "Ignore early process activity"
	^ super primitiveSuspend