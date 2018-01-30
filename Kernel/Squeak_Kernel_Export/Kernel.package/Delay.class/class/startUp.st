snapshotting
startUp
	"Restart active delay, if any, when resuming a snapshot."

	DelaySuspended ifFalse:[^self error: 'Trying to activate Delay twice'].
	DelaySuspended := false.
	self restoreResumptionTimes.
	AccessProtect signal.
