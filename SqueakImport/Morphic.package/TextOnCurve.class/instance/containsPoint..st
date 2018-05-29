selection
containsPoint: aPoint
	"Return true if aPoint is in the actual text areas."
	self textSegmentsDo:
		[:line :destRect :segStart :segAngle |
		(destRect containsPoint: aPoint) ifTrue:
			["It's in the destRect; now check if really in text area"
			(line rectangle containsPoint:
				(self pointInLine: line forDestPoint: aPoint
					segStart: segStart segAngle: segAngle))
				ifTrue: [^ true]]].
	^ false