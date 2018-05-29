accessing
digits: aNumber

	digits := aNumber.
	self removeAllMorphs.
	1 to: digits do: [:i | self addMorph: (LedDigitMorph new color: color)].
	self layoutChanged.
	self changed.