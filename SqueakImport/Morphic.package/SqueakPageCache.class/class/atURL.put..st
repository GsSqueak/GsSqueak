cache access
atURL: aURLString put: aSqueakPage
	"Store the given page in the cache entry for the given URL."

	aSqueakPage url: aURLString.
	aSqueakPage contentsMorph isInMemory ifTrue: [
		aSqueakPage contentsMorph ifNotNil: [
			aSqueakPage contentsMorph setProperty: #SqueakPage 
				toValue: aSqueakPage]].
	PageCache at: aURLString put: aSqueakPage.
