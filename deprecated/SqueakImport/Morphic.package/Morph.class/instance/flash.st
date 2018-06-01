macpal
flash
	| originalColor |
	originalColor := self color.
	[ self color:
		(originalColor
			ifNil: [ Color black ]
			ifNotNil: [( (originalColor alpha: 1) adjustSaturation: 0.8 brightness: 0) negated ]) ]
		ensure:
			[ self refreshWorld.
			self color: originalColor ]