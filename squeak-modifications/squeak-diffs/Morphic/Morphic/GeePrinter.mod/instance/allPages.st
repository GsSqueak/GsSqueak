as yet unclassified
allPages

	| pageNumber allPages maxPages |

	maxPages := 9999.
	pageNumber := 0.
	allPages := self pageRectangles collect: [ :rect |
		pageNumber := pageNumber + 1.
		(self as: GeePrinterPage) pageNumber: pageNumber bounds: rect
	].
	allPages size > maxPages ifTrue: [allPages := allPages first: maxPages].
	allPages do: [ :each | each totalPages: allPages size].
	^allPages

