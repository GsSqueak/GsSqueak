annotation
timeStamp
	"Answer the time stamp for the chosen class and method, if any, else an empty string"

	^ self selection
		ifNil: [String new]
		ifNotNil: [:methodReference | methodReference timeStamp]