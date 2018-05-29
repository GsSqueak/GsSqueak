private-state machine
startSysExclusive: cmdByte
	"The beginning of a variable length 'system exclusive' command."

	sysExBuffer resetContents.
	lastCmdByte := nil.  "system exclusive commands clear running status"
	lastSelector := nil.
	state := #sysExclusive.
