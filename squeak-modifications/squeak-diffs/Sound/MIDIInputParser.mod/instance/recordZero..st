private-state machine
recordZero: cmdByte
	"Record a zero-byte message, such as tune request or a real-time message. Don't change active status. Note that real-time messages can arrive between data bytes without disruption."	

	received addLast: (Array with: timeNow with: cmdByte).
