-Etoys-geometry
colorUnder
	"Return the color of under the receiver's center."
	self isInWorld
		ifTrue: [^ self world
				colorAt: (self pointInWorld: self referencePosition)
				belowMorph: self]
		ifFalse: [^ Color black]