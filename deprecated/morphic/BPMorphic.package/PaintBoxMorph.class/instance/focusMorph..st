other
focusMorph: newFocus 
	"Set the new focus morph"
	focusMorph
		ifNotNil: [focusMorph paletteDetached: self].
	"In case the morph is interested"
	focusMorph := newFocus.
	focusMorph
		ifNotNil: [focusMorph paletteAttached: self]