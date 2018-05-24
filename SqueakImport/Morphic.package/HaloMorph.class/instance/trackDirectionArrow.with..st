private
trackDirectionArrow: anEvent with: shaft
	(shaft hasProperty: #trackDirectionArrow) ifTrue:
		[anEvent hand obtainHalo: self.
		shaft setVertices: {directionArrowAnchor. anEvent cursorPoint}.
		self layoutChanged]