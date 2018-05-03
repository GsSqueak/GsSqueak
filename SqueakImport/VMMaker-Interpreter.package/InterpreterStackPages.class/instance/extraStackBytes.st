initialization
extraStackBytes
	"See initializeStack:numSlots:pageSize:stackLimitOffset:stackPageHeadroom:
	``Because stack pages grow down...''"
	^self cCode: 'BYTES_PER_WORD' inSmalltalk: [0]