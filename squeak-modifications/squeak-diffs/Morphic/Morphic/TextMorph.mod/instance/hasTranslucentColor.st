accessing
hasTranslucentColor
	"Overridden from BorderedMorph to test backgroundColor instead of (text) color."

	^ backgroundColor isNil
		or: [backgroundColor isColor and: [backgroundColor isTranslucentColor]]
		or: [borderColor isColor and: [borderColor isTranslucentColor]]