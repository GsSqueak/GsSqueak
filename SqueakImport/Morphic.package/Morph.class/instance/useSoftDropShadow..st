drop shadows
useSoftDropShadow: aBooleanOrNil

	aBooleanOrNil
		ifNil: [self removeProperty: #useSoftDropShadow]
		ifNotNil: [self setProperty: #useSoftDropShadow toValue: aBooleanOrNil].