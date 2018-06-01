private-state machine
ignoreTwo: cmdByte
	"Ignore a two argument command."	

	lastCmdByte := cmdByte.
	lastSelector := #ignoreTwo:.
	state := #ignore2.
