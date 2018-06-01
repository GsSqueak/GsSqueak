private-state machine
endSysExclusive: cmdByte
	"Error! Received 'end system exclusive' command when not receiving system exclusive data."

	self error: 'unexpected ''End of System Exclusive'' command'.
