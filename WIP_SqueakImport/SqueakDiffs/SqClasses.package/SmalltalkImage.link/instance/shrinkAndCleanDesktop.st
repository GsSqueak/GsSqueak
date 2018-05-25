shrinking
shrinkAndCleanDesktop
	| world |
	world := Project current world.
	world removeAllMorphs.
	self shrink.
	MorphicProject defaultFill: (Color gray: 0.9).
	world color: (Color gray: 0.9)
