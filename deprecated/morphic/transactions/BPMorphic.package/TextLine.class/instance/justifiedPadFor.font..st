scanning
justifiedPadFor: spaceIndex font: aFont 
	"Compute the width of pad for a given space in a line of justified text."
	| _gsSqueakTemp_pad |
	internalSpaces = 0
		ifTrue: [^ 0].
	^ (aFont notNil
			and: [aFont isSubPixelPositioned])
		ifTrue: [paddingWidth * 1.0 / internalSpaces]
		ifFalse: [_gsSqueakTemp_pad := paddingWidth // internalSpaces.
			spaceIndex <= (paddingWidth \\ internalSpaces)
				ifTrue: [_gsSqueakTemp_pad + 1]
				ifFalse: [_gsSqueakTemp_pad]]