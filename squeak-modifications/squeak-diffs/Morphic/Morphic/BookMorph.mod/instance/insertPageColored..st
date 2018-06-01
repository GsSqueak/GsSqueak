insert and delete
insertPageColored: aColor 
	"Insert a new page for the receiver, using the given color as its background color"

	| pageExtent newPage borderWidth backgroundColor |
	backgroundColor := currentPage isNil 
				ifTrue: 
					[pageExtent := pageSize.
					borderWidth := 0.
					Color blue muchLighter]
				ifFalse: 
					[pageExtent := currentPage extent.
					borderWidth := currentPage borderWidth.
					currentPage borderColor].
	newPagePrototype ifNil: 
			[newPage := (PasteUpMorph new)
						extent: pageExtent;
						color: aColor.
			newPage
				borderWidth: borderWidth;
				borderColor: backgroundColor]
		ifNotNil: [newPage := Cursor wait showWhile: [newPagePrototype veryDeepCopy]].
	newPage setNameTo: self defaultNameStemForNewPages.
	newPage vResizeToFit: false.
	pages isEmpty 
		ifTrue: [pages add: (currentPage := newPage)]
		ifFalse: [pages add: newPage after: currentPage].
	self nextPage