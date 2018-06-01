as yet unclassified
makeGalleyStyle

	| all first theRest |

	(self valueOfProperty: #pageBreakRectangles ifAbsent: [#()]) do: [ :each |
		each delete
	].
	self removeProperty: #pageBreakRectangles.
	all := thePasteUp allTextPlusMorphs.
	first := all select: [ :x | x predecessor isNil].
	first size = 1 ifFalse: [^self].
	Cursor wait show.
	first := first first.
	theRest := all reject: [ :x | x predecessor isNil].
	theRest do: [ :each | each delete].
	first autoFit: true.
	first width: self width - 8.
	first recomposeChain.
	first repositionAnchoredMorphs.
	Cursor normal show.
