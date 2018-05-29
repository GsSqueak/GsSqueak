private-state machine
ignoreZero: cmdByte
	"Ignore a zero argument command, such as tune request or a real-time message. Stay in the current and don't change active status. Note that real-time messages can arrive between data bytes without disruption."	

	"do nothing"
