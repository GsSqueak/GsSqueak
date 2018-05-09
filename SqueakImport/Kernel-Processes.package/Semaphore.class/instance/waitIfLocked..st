communication
waitIfLocked: aBlock
	"Use a signal if available, otherwise evaluate aBlock"

	excessSignals == 0 ifTrue: [ ^aBlock value ].
	excessSignals := excessSignals - 1