scripts-standard
getBackgroundColor
	"Answer the background color; the costume is presumed to be a
	TextMorph "
	^ self costume renderedMorph backgroundColor
		ifNil: [Color transparent]