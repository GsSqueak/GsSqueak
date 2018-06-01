drop shadows
hasDropShadow: aBool 
	self hasDropShadow = aBool
		ifTrue: [^ self].
	self changed.
	aBool
		ifTrue: [self setProperty: #hasDropShadow toValue: true]
		ifFalse: [self removeProperty: #hasDropShadow].
	self layoutChanged.
	self changed