navigation
positionAppropriately

	| others otherRects overlaps bottomRight |
	(self ownerThatIsA: HandMorph) ifNotNil: [^self].
	others := ActiveWorld submorphs select: [ :each | each ~~ self and: [each isKindOf: self class]].
	otherRects := others collect: [ :each | each bounds].
	bottomRight := (ActiveWorld hasProperty: #threadNavigatorPosition) ifTrue: [
		ActiveWorld valueOfProperty: #threadNavigatorPosition.
	] ifFalse: [
		ActiveWorld bottomRight.
	].
	self align: self fullBounds bottomRight with: bottomRight.
	self setProperty: #previousWorldBounds toValue: self world bounds.

	[
		overlaps := false.
		otherRects do: [ :r |
			(r intersects: bounds) ifTrue: [overlaps := true. self bottom: r top].
		].
		self top < self world top ifTrue: [
			self bottom: bottomRight y.
			self right: self left - 1.
		].
		overlaps
	] whileTrue.