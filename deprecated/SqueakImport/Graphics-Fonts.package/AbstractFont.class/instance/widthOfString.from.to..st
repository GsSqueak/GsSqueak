measuring
widthOfString: aString from: startIndex to: stopIndex
	"Measure the length of the given string between start and stop index"
	| resultX |
	resultX := 0.
	startIndex to: stopIndex do: [:i | 
		resultX := resultX + (self widthOf: (aString at: i))].
	^resultX