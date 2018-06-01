running
hideSplashMorph
	SplashMorph ifNil:[^self].
	self showSplash
		ifFalse: [^self].
	SplashMorph delete.
	Project current world submorphs do:[:m| m visible: true]. "show all"
