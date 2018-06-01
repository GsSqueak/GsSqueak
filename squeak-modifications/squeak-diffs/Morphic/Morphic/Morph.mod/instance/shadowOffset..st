drop shadows
shadowOffset: aPoint
	"Set the current shadow offset"

	self shadowOffset = aPoint ifTrue: [^ self].
	self changed.

	(aPoint isNil or: [ aPoint isZero ])
		ifTrue:[self removeProperty: #shadowOffset]
		ifFalse:[self setProperty: #shadowOffset toValue: aPoint].

	self removeProperty: #dropShadow.
	self layoutChanged.
	self changed.