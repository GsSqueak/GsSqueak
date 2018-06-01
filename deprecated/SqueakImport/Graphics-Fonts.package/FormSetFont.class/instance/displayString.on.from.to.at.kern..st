displaying
displayString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta
	"Draw the given string from startIndex to stopIndex "

	combinationRule ifNotNil: [:r | aBitBlt combinationRule: r].
	tintable == false ifTrue: [aBitBlt colorMap: nil].
	
	^ super displayString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta