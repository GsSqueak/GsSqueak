insert and delete
insertPageSilentlyAtEnd
	"Create a new page at the end of the book.  Do not turn to it."

	| sz newPage bw bc cc |
	cc := currentPage isNil 
				ifTrue: 
					[sz := pageSize.
					bw := 0.
					bc := Color blue muchLighter.
					color]
				ifFalse: 
					[sz := currentPage extent.
					bw := currentPage borderWidth.
					bc := currentPage borderColor.
					currentPage color].
	newPagePrototype ifNil: 
			[newPage := (PasteUpMorph new)
						extent: sz;
						color: cc.
			newPage
				borderWidth: bw;
				borderColor: bc]
		ifNotNil: [newPage := Cursor wait showWhile: [newPagePrototype veryDeepCopy]].
	newPage setNameTo: self defaultNameStemForNewPages.
	newPage vResizeToFit: false.
	pages isEmpty 
		ifTrue: [pages add: (currentPage := newPage)	"had been none"]
		ifFalse: [pages add: newPage after: pages last].
	^newPage