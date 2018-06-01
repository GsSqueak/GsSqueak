menu
getStemUrl
	"Try to find the old place where this book was stored. Confirm with the 
	user. Else ask for new place."
	| initial pg url knownURL |

	knownURL := false.
	initial := ''.
	(pg := currentPage valueOfProperty: #SqueakPage)
		ifNotNil: [pg contentsMorph == currentPage
				ifTrue: [initial := pg url.
					knownURL := true]].
	"If this page has a url"
	pages
		doWithIndex: [:aPage :ind | initial isEmpty
				ifTrue: [aPage isInMemory
						ifTrue: [(pg := aPage valueOfProperty: #SqueakPage)
								ifNotNil: [initial := pg url]]]].
	"any page with a url"
	initial isEmpty
		ifTrue: [initial := ServerDirectory defaultStemUrl , '1.sp'].
	"A new legal place"
	url := knownURL
		ifTrue: [initial]
		ifFalse: [UIManager default request: 'url of the place to store a typical page in this book.
Must begin with file:// or ftp://' translated initialAnswer: initial].
	^ SqueakPage stemUrl: url