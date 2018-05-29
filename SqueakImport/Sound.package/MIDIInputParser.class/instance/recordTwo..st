private-state machine
recordTwo: cmdByte
	"Record a two argument command at the current time."	

	lastCmdByte := cmdByte.
	lastSelector := #recordTwo:.
	state := #want1of2.
