accessing
contents
	"Answer with a copy of my collection from the start to the current position."
	readLimit := readLimit max: position.
	^collection copyFrom: (initialPositionOrNil ifNil: [1]) to: position