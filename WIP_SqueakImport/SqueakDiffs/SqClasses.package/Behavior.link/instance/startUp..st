system startup
startUp: resuming
	"This message is sent to registered classes when the system is coming up.
	 resuming will be true if a snapshot is being resumed.  resuming will be false
	 if the system is merely reinitializing after writing a snapshot."
	^self startUp
