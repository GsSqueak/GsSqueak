common requests
eval: aString
	"Evaluate the string in a neutral context, and under certain circumstances print the 
	result in the transcript"

	| result |
	result := Compiler new evaluate: aString in: nil to: nil.
	(result isNumber) | (result isString)
		ifTrue:
			[Transcript cr; nextPutAll: result printString]