displaying
displayStringR2L: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta
	"You are screwed if you reach this method."
	self halt.
	aBitBlt displayString: aString 
			from: startIndex 
			to: stopIndex 
			at: aPoint 
			strikeFont: self
			kern: kernDelta.