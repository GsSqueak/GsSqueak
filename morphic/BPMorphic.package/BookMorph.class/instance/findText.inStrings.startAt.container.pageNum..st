menu
findText: keys inStrings: rawStrings startAt: startIndex container: oldContainer pageNum: pageNum 
	"Call once to search a page of the book. Return true if found and
	highlight the text. oldContainer should be NIL. 
	(oldContainer is only non-nil when (1) doing a 'search again' and (2)
	the page is in memory and (3) keys has just one element.
	oldContainer is a TextMorph.)"
	| _gsSqueakTemp_container _gsSqueakTemp_wasIn _gsSqueakTemp_strings _gsSqueakTemp_good _gsSqueakTemp_insideOf _gsSqueakTemp_place _gsSqueakTemp_start |
	_gsSqueakTemp_good := true.
	_gsSqueakTemp_start := startIndex.
	_gsSqueakTemp_strings := oldContainer
				ifNil: ["normal case"
					rawStrings]
				ifNotNil: [(pages at: pageNum) isInMemory
						ifTrue: [(pages at: pageNum)
								allStringsAfter: oldContainer]
						ifFalse: [rawStrings]].
	keys
		do: [:searchString | | thisWord | "each key"
			_gsSqueakTemp_good
				ifTrue: [thisWord := false.
					_gsSqueakTemp_strings
						do: [:longString | 
							| index |
							(index := longString
											findString: searchString
											startingAt: _gsSqueakTemp_start
											caseSensitive: false) > 0
								ifTrue: [thisWord not & (searchString == keys first)
										ifTrue: [_gsSqueakTemp_insideOf := longString.
											_gsSqueakTemp_place := index].
									thisWord := true].
							_gsSqueakTemp_start := 1].
					"only first key on first container"
					_gsSqueakTemp_good := thisWord]].
	_gsSqueakTemp_good
		ifTrue: ["all are on this page"
			_gsSqueakTemp_wasIn := (pages at: pageNum) isInMemory.
			self goToPage: pageNum.
			_gsSqueakTemp_wasIn
				ifFalse: ["search again, on the real current text. Know page is
					in. "
					^ self
						findText: keys
						inStrings: ((pages at: pageNum)
								allStringsAfter: nil)
						startAt: startIndex
						container: oldContainer
						pageNum: pageNum"recompute"]].
	(self valueOfProperty: #searchContainer)
		ifNotNil: [:_gsSqueakTemp_old | (_gsSqueakTemp_old respondsTo: #editor)
				ifTrue: [_gsSqueakTemp_old editor selectFrom: 1 to: 0.
					"trying to remove the previous selection!"
					_gsSqueakTemp_old changed]].
	_gsSqueakTemp_good
		ifTrue: ["have the exact string object"
			(_gsSqueakTemp_container := oldContainer)
				ifNil: [_gsSqueakTemp_container := self
								highlightText: keys first
								at: _gsSqueakTemp_place
								in: _gsSqueakTemp_insideOf]
				ifNotNil: [_gsSqueakTemp_container userString == _gsSqueakTemp_insideOf
						ifTrue: [_gsSqueakTemp_container isTextMorph
								ifTrue: [_gsSqueakTemp_container editor selectFrom: _gsSqueakTemp_place to: keys first size - 1 + _gsSqueakTemp_place.
									_gsSqueakTemp_container changed]]
						ifFalse: [_gsSqueakTemp_container := self
										highlightText: keys first
										at: _gsSqueakTemp_place
										in: _gsSqueakTemp_insideOf]].
			self setProperty: #searchContainer toValue: _gsSqueakTemp_container.
			self setProperty: #searchOffset toValue: _gsSqueakTemp_place.
			self setProperty: #searchKey toValue: keys.
			"override later"
			ActiveHand newKeyboardFocus: _gsSqueakTemp_container.
			^ true].
	^ false