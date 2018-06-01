converting
squeakToMac
	"Convert the receiver from Squeak to MacRoman encoding"
	^ self class new setString: string squeakToMac setRuns: runs copy