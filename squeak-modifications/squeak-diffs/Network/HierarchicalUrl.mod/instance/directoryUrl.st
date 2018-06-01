access
directoryUrl
	"The path always has at least one element so this works."

	^self copy path: (path copyFrom: 1 to: path size - 1)