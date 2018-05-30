displaying
displayString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta
	"Draw the given string from startIndex to stopIndex 
	at aPoint on the (already prepared) BitBlt."
	
	| pt |
	(aString isByteString) ifFalse: [^ self displayMultiString: aString on: aBitBlt from: startIndex to: stopIndex at: aPoint kern: kernDelta baselineY: aPoint y + self ascent.].

	pt := aBitBlt displayString: aString 
			from: startIndex 
			to: stopIndex 
			at: aPoint 
			strikeFont: self
			kern: kernDelta.
	pt = aPoint ifFalse:[^pt].
	"In some situations BitBlt doesn't return the advance width from the primitive.
	Work around the situation"
	^aPoint x + (self widthOfString: aString from: startIndex to: stopIndex) + (stopIndex-startIndex+1*kernDelta) @ aPoint y
