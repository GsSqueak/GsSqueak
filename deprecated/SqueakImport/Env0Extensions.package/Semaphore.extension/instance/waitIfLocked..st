*Env0Extensions-communication
waitIfLocked: aBlock
	"Use a signal if available, otherwise evaluate aBlock"

	signalCount == 0 ifTrue: [ ^aBlock value ].
	signalCount := signalCount - 1
