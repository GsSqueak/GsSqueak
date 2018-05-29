private-state machine
recordOne: cmdByte
	"Record a one argument command at the current time."	

	lastCmdByte := cmdByte.
	lastSelector := #recordOne:.
	state := #want1only.
