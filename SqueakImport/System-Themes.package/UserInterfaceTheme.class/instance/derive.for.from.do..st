building
derive: propertySymbol for: aClassOrSymbol from: anotherClassOrSymbol do: block

	^ self
		derive: propertySymbol
		for: aClassOrSymbol
		from: anotherClassOrSymbol
		at: propertySymbol
		do: block