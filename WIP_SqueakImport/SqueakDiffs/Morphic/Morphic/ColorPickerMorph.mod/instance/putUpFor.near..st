other
putUpFor: aMorph near: aRectangle
	"Put the receiver up on the screen.   Note highly variant behavior depending on the setting of the #modalColorPickers preference"
	| layerNumber |
	aMorph isMorph ifTrue: [
		layerNumber := aMorph morphicLayerNumber.
		aMorph allOwnersDo:[:m|
			layerNumber := layerNumber min: m morphicLayerNumber].
		self setProperty: #morphicLayerNumber toValue: layerNumber - 0.1
	].

	isModal == true "backward compatibility"
		ifTrue:
			[self pickUpColorFor: aMorph]
		ifFalse:
			[self addToWorld:
				((aMorph notNil and: [aMorph world notNil])
					ifTrue:
						[aMorph world]
					ifFalse:
						[self currentWorld])
		  		near:
					(aRectangle ifNil:
						[aMorph ifNil: [100@100 extent: 1@1] ifNotNil: [aMorph fullBoundsInWorld]])]