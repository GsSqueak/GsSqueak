scraps
emptyScrapBook
	| oldScraps |
	oldScraps := book.
	book := nil. "Creates it afresh"
	book := self scrapBook.
	(oldScraps notNil and: [oldScraps owner notNil])
		ifTrue:
			[book position: oldScraps position.
			oldScraps owner replaceSubmorph: oldScraps by: book.
			book changed; layoutChanged]