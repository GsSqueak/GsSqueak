measuring
widthOfString: aString from: startIndex to: stopIndex 
	"Measure the length of the given string between start and stop
	index "
	| _gsSqueakTemp_resultX |
	_gsSqueakTemp_resultX := 0.
	startIndex
		to: stopIndex
		do: [:i | _gsSqueakTemp_resultX := _gsSqueakTemp_resultX
						+ (self
								widthOf: (aString at: i))].
	^ _gsSqueakTemp_resultX