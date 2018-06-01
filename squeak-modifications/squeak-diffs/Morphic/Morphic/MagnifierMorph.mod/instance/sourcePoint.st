magnifying
sourcePoint
	"If we are being dragged use our center, otherwise use pointer position"
	^(trackPointer not or: [owner notNil and: [owner isHandMorph]])
		ifTrue: [self isFlexed ifTrue:[owner center] ifFalse:[self center]]
		ifFalse: [self currentHand position]