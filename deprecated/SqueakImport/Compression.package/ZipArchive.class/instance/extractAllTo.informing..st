archive operations
extractAllTo: aDirectory informing: bar
	"Extract all elements to the given directory, notifying the user of progress"
	^self extractAllTo: aDirectory informing: bar overwrite: false