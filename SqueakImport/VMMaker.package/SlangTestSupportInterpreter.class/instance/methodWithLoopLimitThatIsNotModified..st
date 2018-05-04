loop limits
methodWithLoopLimitThatIsNotModified: arrayObj

	0 to: 10 do: [:i | self storePointerUnchecked: i ofObject: arrayObj withValue: nilObj]
