as yet unclassified
toggleOrientation

	self setProperty: #orientedVertically toValue: self orientedVertically not.
	self setProperty: #currentNavigatorVersion toValue: self currentNavigatorVersion - 1.

