private-state machine
ignoreOne: cmdByte
	"Ignore a one argument command."	

	lastCmdByte := cmdByte.
	lastSelector := #ignoreOne:.
	state := #ignore1.
