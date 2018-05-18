drop shadows
shadowColor: aColor
	self shadowColor = aColor ifTrue: [^ self].
	self setProperty: #shadowColor toValue: aColor.
	self removeProperty: #dropShadow.
	self changed.