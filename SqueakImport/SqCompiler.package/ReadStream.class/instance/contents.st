accessing
contents
	"Answer with a copy of my collection from the start to readLimit."

	^collection copyFrom: (initialPositionOrNil ifNil: [1]) to: readLimit