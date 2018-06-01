menu
reserveUrls
	"Save a dummy version of the book first, assign all pages URLs, write dummy files to reserve the url, and write the index.  Good when I have pages with interpointing bookmarks."

	| stem |
	(stem := self getStemUrl) isEmpty ifTrue: [^self].
	pages doWithIndex: 
			[:pg :ind | 
			"does write the current page too"

			pg url ifNil: [pg reserveUrl: stem , ind printString , '.sp']]

	"self saveIndexOnURL."