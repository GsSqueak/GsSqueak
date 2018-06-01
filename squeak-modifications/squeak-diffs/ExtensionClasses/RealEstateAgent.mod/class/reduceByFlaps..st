*Morphic-MorphicExtras-utilities
reduceByFlaps: aScreenRect 
	"Return a rectangle that won't interfere with default shared flaps"

	| top bottom left right |
	Flaps sharedFlapsAllowed ifFalse: [^ aScreenRect copy].

	top := bottom := left := right := 0.
	Flaps globalFlapTabs do: [ :ft | | w h |
			w := ft width.
			h := ft height.
			ft edgeToAdhereTo
				caseOf: {
					[ #top ] -> [ top := top max: h ].
					[ #bottom ] -> [ bottom := bottom max: h ] .
					[ #left ] -> [ left := left max: w ] .
					[ #right ] -> [ right := right max: w ] .
				}
				otherwise: [] ].
	^ Rectangle
		origin: aScreenRect origin + (left @ top)
		extent: aScreenRect extent - (bottom @ right).
