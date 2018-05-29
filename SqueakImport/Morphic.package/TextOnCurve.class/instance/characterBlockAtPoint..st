selection
characterBlockAtPoint: aPoint 
	"Answer a CharacterBlock for the character in the text at aPoint."
	| curvePoint cb |
	self textSegmentsDo:
		[:line :destRect :segStart :segAngle | | sourcePoint |
		(destRect containsPoint: aPoint) ifTrue:
			["It's in the destRect; now convert to source coords"
			sourcePoint := self pointInLine: line forDestPoint: aPoint
							segStart: segStart segAngle: segAngle.
			cb := (CharacterBlockScanner new text: text textStyle: textStyle)
				characterBlockAtPoint: (sourcePoint adhereTo: line rectangle)
				index: nil in: line.
			(sourcePoint x between: line left and: line right) ifTrue:
				["Definitely in this segment"
				^ cb]]].
	"Point is off curve -- try again with closest point on curve"
	curvePoint := curve closestPointTo: aPoint.
	curvePoint = aPoint ifFalse:
		[^ self characterBlockAtPoint: curvePoint].
	"If all else fails, at least return something acceptable."
	^ cb ifNil: [self defaultCharacterBlock]