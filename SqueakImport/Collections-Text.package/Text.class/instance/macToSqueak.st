converting
macToSqueak
	"Convert the receiver from MacRoman to Squeak encoding"
	^ self class new setString: string macToSqueak setRuns: runs copy