menu
makeSecondTopmost

	| aWorld nextWindow |
	aWorld := self world.
	nextWindow := aWorld submorphs 
				detect: [:m | (m isSystemWindow) and: [m ~~ self]]
				ifNone: [^self].

	self comeToFront.
	nextWindow beKeyWindow.