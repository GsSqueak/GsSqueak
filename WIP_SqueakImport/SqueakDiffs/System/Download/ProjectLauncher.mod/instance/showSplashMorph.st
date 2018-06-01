running
showSplashMorph
	| world |
	SplashMorph ifNil:[^self].
	self showSplash
		ifFalse: [^self].
	world := Project current world.
	world submorphs do:[:m| m visible: false]. "hide all"
	world addMorphCentered: SplashMorph.
	world displayWorldSafely.