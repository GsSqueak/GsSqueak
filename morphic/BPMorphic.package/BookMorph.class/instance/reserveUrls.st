menu
reserveUrls
	"Save a dummy version of the book first, assign all pages URLs, write
	dummy files to reserve the url, and write the index. Good when I have
	pages with interpointing bookmarks."
	| _gsSqueakTemp_stem |
	(_gsSqueakTemp_stem := self getStemUrl) isEmpty
		ifTrue: [^ self].
	pages
		doWithIndex: [:pg :ind | "does write the current page too"
			pg url
				ifNil: [pg reserveUrl: _gsSqueakTemp_stem , ind printString , '.sp']
			"self saveIndexOnURL."]