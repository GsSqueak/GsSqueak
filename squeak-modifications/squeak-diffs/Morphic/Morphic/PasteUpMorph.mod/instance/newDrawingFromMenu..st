world menu
newDrawingFromMenu: evt
	self assureNotPaintingElse: [^ self].
	evt hand attachMorph: PaintInvokingMorph new markAsPartsDonor