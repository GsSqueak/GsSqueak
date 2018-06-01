visual properties
fillStyle
	"Answer the receiver's fillStyle.  For an *open* polygon, we return the borderColor, provided it's a true color rather than something strange like the symbol #raised."

	| aColor |
	self isOpen
		ifTrue:
			[(aColor := self borderColor) isColor ifTrue: [^ aColor]].   "easy access to line color from halo -- di's old note"
	
	^ super fillStyle