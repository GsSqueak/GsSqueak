accessing
bounds
	textSegments ifNil: [^nil].
	^textSegments inject: (textSegments first first)
		into: [:bnd :each | bnd merge: (each first)]