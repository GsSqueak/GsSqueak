converting
readStream
	"Answer a readStream on my contents truncated to current position.
	Beware, the readStream shares the contents, so it will be modified if I'm written backward."
	readLimit := readLimit max: position.
	^ReadStream on: collection from: (initialPositionOrNil ifNil: [1]) to: position