dropping/grabbing
justDroppedInto: aMorph event: event

	"Restore drop shadow if necessary."
	self hasDropShadow: Preferences menuAppearance3d.

	self exclusive ifTrue: [
		"aggressively preserve focus"
		event hand newMouseFocus: self].