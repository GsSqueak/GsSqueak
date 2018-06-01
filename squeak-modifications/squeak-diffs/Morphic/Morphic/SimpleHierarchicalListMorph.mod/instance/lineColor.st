accessing
lineColor
	"Answer a good color to use for drawing the lines that connect members of the hierarchy view.
	Used the cached color, or derive it if necessary by finding the first owner (up to my root) that is not transparent, then picking a contrasting color.
	Fall back to veryLightGray if all my owners are transparent."

	| coloredOwner targetLuminance ownerColor darken |
	lineColor ifNotNil: [ ^lineColor ].
	coloredOwner := self firstOwnerSuchThat: [ :o | o isWorldOrHandMorph not and: [ o color isTransparent not ]].
	coloredOwner ifNil: [ ^Color veryLightGray ].
	ownerColor := coloredOwner color.
	darken := ownerColor luminance > 0.5.
	targetLuminance := ownerColor luminance + (darken ifTrue: [ -0.2 ] ifFalse: [ 0.2 ]).
	^darken
		ifTrue: [ ownerColor atMostAsLuminentAs: targetLuminance ]
		ifFalse: [ ownerColor atLeastAsLuminentAs: targetLuminance ]
	
