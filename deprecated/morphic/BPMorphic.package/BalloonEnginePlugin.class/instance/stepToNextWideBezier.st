beziers-wide
stepToNextWideBezier
	"Initialize the current entry in the GET by stepping to the current scan
	line "
	self
		stepToNextWideBezierIn: (aetBuffer at: self aetStartGet)
		at: self currentYGet