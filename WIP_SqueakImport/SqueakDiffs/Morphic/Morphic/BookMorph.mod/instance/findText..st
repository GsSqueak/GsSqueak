menu
findText: wants
	"Turn to the next page that has all of the strings mentioned on it.  Highlight where it is found.  allText and allTextUrls have been set.  Case insensitive search.
	Resuming a search.  If container's text is still in the list and secondary keys are still in the page, (1) search rest of that container.  (2) search rest of containers on that page (3) pages till end of book, (4) from page 1 to this page again."

	"Later sort wants so longest key is first"
	| allText here fromHereOn startToHere oldContainer oldIndex otherKeys strings good |
	allText := self valueOfProperty: #allText ifAbsent: [#()].
	here := pages identityIndexOf: currentPage ifAbsent: [1].
	fromHereOn := here+1 to: pages size.
	startToHere := 1 to: here.		"repeat this page"
	(self valueOfProperty: #searchKey ifAbsent: [#()]) = wants ifTrue: [
		"does page have all the other keys?  No highlight if found!"
		otherKeys := wants allButFirst.
		strings := allText at: here.
		good := true.
		otherKeys do: [:searchString | | thisWord | "each key"
			good ifTrue: [thisWord := false.
				strings do: [:longString |
					(longString findString: searchString startingAt: 1 
						caseSensitive: false) > 0 ifTrue: [
							thisWord := true]].
				good := thisWord]].
		good ifTrue: ["all are on this page.  Look in rest for string again."
			oldContainer := self valueOfProperty: #searchContainer.
			oldIndex := self valueOfProperty: #searchOffset.
			(self findText: (OrderedCollection with: wants first) inStrings: strings	
				startAt: oldIndex+1 container: oldContainer 
				pageNum: here) ifTrue: [
					self setProperty: #searchKey toValue: wants.
					^ true]]]
		ifFalse: [fromHereOn := here to: pages size].	"do search this page"
	"other pages"
	allText ifNotEmpty: [
		fromHereOn do: [:pageNum |
			(self findText: wants inStrings: (allText at: pageNum) startAt: 1 container: nil 
					pageNum: pageNum) 
					ifTrue: [^ true]].
		startToHere do: [:pageNum |
			(self findText: wants inStrings: (allText at: pageNum) startAt: 1 container: nil 
					pageNum: pageNum) 
						ifTrue: [^ true]]].
	"if fail"
	self setProperty: #searchContainer toValue: nil.
	self setProperty: #searchOffset toValue: nil.
	self setProperty: #searchKey toValue: nil.
	^ false