common requests
eval: aString 
	"Evaluate the string in a neutral context, and under certain
	circumstances print the 
	result in the transcript"
	| _gsSqueakTemp_result |
	_gsSqueakTemp_result := Compiler new
				evaluate: aString
				in: nil
				to: nil.
	_gsSqueakTemp_result isNumber | _gsSqueakTemp_result isString
		ifTrue: [Transcript cr; nextPutAll: _gsSqueakTemp_result printString]