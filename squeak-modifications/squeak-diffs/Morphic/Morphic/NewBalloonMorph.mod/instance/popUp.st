initialization
popUp
	"No tail. Centered in the balloon owner. Do not remove other balloon helps."
	
	| w |	
	self balloonOwner ifNil: [^ self].
	self balloonOwner isInWorld ifFalse: [^ self].
	
	w := self balloonOwner world.
	
	self hasTail: false.
	self center: self balloonOwner center.
	self bounds: (self bounds translatedToBeWithin: w bounds).
	
	w activeHand addBalloonHelp: self.
	self openInWorld.