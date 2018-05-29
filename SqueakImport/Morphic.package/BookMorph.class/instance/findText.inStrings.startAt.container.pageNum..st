menu
findText: keys inStrings: rawStrings startAt: startIndex container: oldContainer pageNum: pageNum 
	"Call once to search a page of the book.  Return true if found and highlight the text.  oldContainer should be NIL.  
	(oldContainer is only non-nil when (1) doing a 'search again' and (2) the page is in memory and (3) keys has just one element.  oldContainer is a TextMorph.)"

	| container wasIn strings old good insideOf place start |
	good := true.
	start := startIndex.
	strings := oldContainer ifNil: 
					["normal case"

					rawStrings]
				ifNotNil: 
					[(pages at: pageNum) isInMemory 
						ifFalse: [rawStrings]
						ifTrue: [(pages at: pageNum) allStringsAfter: oldContainer]].
	keys do: 
			[:searchString | | thisWord | 
			"each key"

			good 
				ifTrue: 
					[thisWord := false.
					strings do: 
							[:longString | | index | 
							(index := longString 
										findString: searchString
										startingAt: start
										caseSensitive: false) > 0 
								ifTrue: 
									[thisWord not & (searchString == keys first) 
										ifTrue: 
											[insideOf := longString.
											place := index].
									thisWord := true].
							start := 1].	"only first key on first container"
					good := thisWord]].
	good 
		ifTrue: 
			["all are on this page"

			wasIn := (pages at: pageNum) isInMemory.
			self goToPage: pageNum.
			wasIn 
				ifFalse: 
					["search again, on the real current text.  Know page is in."

					^self 
						findText: keys
						inStrings: ((pages at: pageNum) allStringsAfter: nil)
						startAt: startIndex
						container: oldContainer
						pageNum: pageNum	"recompute"]].
	(old := self valueOfProperty: #searchContainer) ifNotNil: 
			[(old respondsTo: #editor) 
				ifTrue: 
					[old editor selectFrom: 1 to: 0.	"trying to remove the previous selection!"
					old changed]].
	good 
		ifTrue: 
			["have the exact string object"

			(container := oldContainer) ifNil: 
					[container := self 
								highlightText: keys first
								at: place
								in: insideOf]
				ifNotNil: 
					[container userString == insideOf 
						ifFalse: 
							[container := self 
										highlightText: keys first
										at: place
										in: insideOf]
						ifTrue: 
							[(container isTextMorph) 
								ifTrue: 
									[container editor selectFrom: place to: keys first size - 1 + place.
									container changed]]].
			self setProperty: #searchContainer toValue: container.
			self setProperty: #searchOffset toValue: place.
			self setProperty: #searchKey toValue: keys.	"override later"
			ActiveHand newKeyboardFocus: container.
			^true].
	^false