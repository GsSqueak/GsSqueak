accessing
compositionWindowManager
	CompositionWindowManager ifNotNil: [^CompositionWindowManager].
	Smalltalk platformName = 'Win32' 
		ifTrue: [^CompositionWindowManager := ImmWin32 new].
	(Smalltalk platformName = 'unix' 
		and: [(Smalltalk windowSystemName) = 'X11']) 
			ifTrue: [^CompositionWindowManager := ImmX11 new].
	^CompositionWindowManager := ImmAbstractPlatform new