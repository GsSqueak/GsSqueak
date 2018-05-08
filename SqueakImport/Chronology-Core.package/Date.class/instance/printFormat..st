printing
printFormat: formatArray 
	"Answer a String describing the receiver using the argument formatArray."

	^String new: 17 streamContents: [ :stream |
		self printOn: stream format: formatArray ]