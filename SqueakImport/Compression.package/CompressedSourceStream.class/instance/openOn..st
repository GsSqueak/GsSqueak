open/close
openOn: aFile
	"Open the receiver."
	segmentFile := aFile.
	segmentFile binary.
	segmentFile size > 0
	ifTrue:
		[self readHeaderInfo.  "If file exists, then read the parameters"]
	ifFalse:
		[self segmentSize: 20000 maxSize: 34000000.  "Otherwise write default values"]