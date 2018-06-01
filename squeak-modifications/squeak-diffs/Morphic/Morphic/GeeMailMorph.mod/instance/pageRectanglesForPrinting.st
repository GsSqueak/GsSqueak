as yet unclassified
pageRectanglesForPrinting

	| pageBreaks pageRects prevBottom |

	pageBreaks := self valueOfProperty: #pageBreakRectangles ifAbsent: [^nil].
	prevBottom := 0.
	pageRects := pageBreaks collect: [ :each | | r |
		r := 0@prevBottom corner: self width @ each top.
		prevBottom := each bottom.
		r
	].
	pageRects add: (0@prevBottom corner: self width @ thePasteUp bottom).
	^pageRects