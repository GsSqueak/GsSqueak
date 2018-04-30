menu
findText: wants 
	"Turn to the next page that has all of the strings mentioned on it.
	Highlight where it is found. allText and allTextUrls have been set. Case
	insensitive search.
	Resuming a search. If container's text is still in the list and secondary
	keys are still in the page, (1) search rest of that container. (2) search
	rest of containers on that page (3) pages till end of book, (4) from
	page 1 to this page again."
	"Later sort wants so longest key is first"
	| _gsSqueakTemp_allText _gsSqueakTemp_here _gsSqueakTemp_fromHereOn _gsSqueakTemp_startToHere _gsSqueakTemp_oldContainer _gsSqueakTemp_oldIndex _gsSqueakTemp_otherKeys _gsSqueakTemp_strings _gsSqueakTemp_good |
	_gsSqueakTemp_allText := self
				valueOfProperty: #allText
				ifAbsent: [#()].
	_gsSqueakTemp_here := pages
				identityIndexOf: currentPage
				ifAbsent: [1].
	_gsSqueakTemp_fromHereOn := _gsSqueakTemp_here + 1 to: pages size.
	_gsSqueakTemp_startToHere := 1 to: _gsSqueakTemp_here.
	"repeat this page"
	(self
			valueOfProperty: #searchKey
			ifAbsent: [#()])
			= wants
		ifTrue: ["does page have all the other keys? No highlight if found!"
			_gsSqueakTemp_otherKeys := wants allButFirst.
			_gsSqueakTemp_strings := _gsSqueakTemp_allText at: _gsSqueakTemp_here.
			_gsSqueakTemp_good := true.
			_gsSqueakTemp_otherKeys
				do: [:searchString | | thisWord | "each key"
					_gsSqueakTemp_good
						ifTrue: [thisWord := false.
							_gsSqueakTemp_strings
								do: [:longString | (longString
											findString: searchString
											startingAt: 1
											caseSensitive: false)
											> 0
										ifTrue: [thisWord := true]].
							_gsSqueakTemp_good := thisWord]].
			_gsSqueakTemp_good
				ifTrue: ["all are on this page. Look in rest for string again."
					_gsSqueakTemp_oldContainer := self valueOfProperty: #searchContainer.
					_gsSqueakTemp_oldIndex := self valueOfProperty: #searchOffset.
					(self
							findText: (OrderedCollection with: wants first)
							inStrings: _gsSqueakTemp_strings
							startAt: _gsSqueakTemp_oldIndex + 1
							container: _gsSqueakTemp_oldContainer
							pageNum: _gsSqueakTemp_here)
						ifTrue: [self setProperty: #searchKey toValue: wants.
							^ true]]]
		ifFalse: [_gsSqueakTemp_fromHereOn := _gsSqueakTemp_here to: pages size].
	"do search this page"
	"other pages"
	_gsSqueakTemp_allText
		ifNotEmpty: [_gsSqueakTemp_fromHereOn
				do: [:pageNum | (self
							findText: wants
							inStrings: (_gsSqueakTemp_allText at: pageNum)
							startAt: 1
							container: nil
							pageNum: pageNum)
						ifTrue: [^ true]].
			_gsSqueakTemp_startToHere
				do: [:pageNum | (self
							findText: wants
							inStrings: (_gsSqueakTemp_allText at: pageNum)
							startAt: 1
							container: nil
							pageNum: pageNum)
						ifTrue: [^ true]]].
	"if fail"
	self setProperty: #searchContainer toValue: nil.
	self setProperty: #searchOffset toValue: nil.
	self setProperty: #searchKey toValue: nil.
	^ false