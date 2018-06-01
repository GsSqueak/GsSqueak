panes
updateBox: anIconMorph color: aColor 
	| _gsSqueakTemp_fill |
	anIconMorph isNil
		ifTrue: [^ self].
	anIconMorph extent: self boxExtent;
		 useRoundedCorners.
	SystemWindow gradientWindow
		ifTrue: [_gsSqueakTemp_fill := GradientFillStyle ramp: {0.0 -> aColor muchLighter muchLighter. 1.0 -> aColor twiceDarker}.
			_gsSqueakTemp_fill origin: anIconMorph topLeft + (5 @ 5).
			_gsSqueakTemp_fill direction: anIconMorph extent.
			anIconMorph fillStyle: _gsSqueakTemp_fill]
		ifFalse: [anIconMorph color: aColor].
	anIconMorph
		borderWidth: (Preferences alternativeWindowBoxesLook
				ifTrue: [1]
				ifFalse: [0]);
		 borderColor: aColor darker