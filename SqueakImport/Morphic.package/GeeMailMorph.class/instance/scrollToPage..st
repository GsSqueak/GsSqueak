as yet unclassified
scrollToPage: pageNumber

	| rects oneRect |

	rects := self valueOfProperty: #pageBreakRectangles ifAbsent: [#()].
	oneRect := rects at: pageNumber - 1 ifAbsent: [0@0 extent: 0@0].
	self scrollToYAbsolute: oneRect bottom.
