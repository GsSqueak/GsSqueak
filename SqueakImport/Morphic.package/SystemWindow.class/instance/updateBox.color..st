panes
updateBox: anIconMorph color: aColor 

	| fill |
	anIconMorph isNil
		ifTrue: [^ self].
	anIconMorph
		extent: self boxExtent;
		useRoundedCorners.

	SystemWindow gradientWindow
		ifFalse: [anIconMorph color: aColor]
		ifTrue: [	
			fill := GradientFillStyle ramp: {
				0.0 -> aColor muchLighter muchLighter.
				1.0 -> aColor twiceDarker}.
			fill origin: anIconMorph topLeft + (5 @ 5).
			fill direction: anIconMorph extent.
			anIconMorph fillStyle: fill].

	anIconMorph
		borderWidth: (Preferences alternativeWindowBoxesLook
			ifTrue: [1]
			ifFalse: [0]);
		borderColor: aColor darker.