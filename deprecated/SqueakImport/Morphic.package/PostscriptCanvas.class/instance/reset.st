initialization
reset
	super reset.
	origin := 0 @ 0.				"origin of the top-left corner of this canvas"
	clipRect := 0 @ 0 corner: 10000 @ 10000.		"default clipping rectangle"
	currentTransformation := nil.
	morphLevel := 0.
	pages := 0.
	gstateStack := OrderedCollection new.
	usedFonts := Dictionary new.
	initialScale := 1.0.
	shadowColor := nil.
	currentColor := nil