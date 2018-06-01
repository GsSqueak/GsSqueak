get/set
setPreference: prefSymbol toValue: anObject during: aBlock

	(self valueOfPreference: prefSymbol) in: [:previous |
		self setPreference: prefSymbol toValue: anObject.
		aBlock ensure: [self setPreference: prefSymbol toValue: previous]].