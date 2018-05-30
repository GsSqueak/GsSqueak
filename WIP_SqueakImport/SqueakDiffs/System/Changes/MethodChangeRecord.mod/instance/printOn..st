as yet unclassified
printOn: strm

	super printOn: strm.
	strm nextPutAll: ' ('; print: changeType; nextPutAll: ')'